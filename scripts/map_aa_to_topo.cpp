#include <string>

#include <cassert>
#include <iostream>
#include <iterator>
#include <fstream>
#include <vector>
#include <map>

///Determines if a filename is a regular file
///From http://www.richelbilderbeek.nl/CppIsRegularFile.htm
bool file_exists(const std::string& filename)
{
  std::fstream f;
  f.open(filename.c_str(),std::ios::in);
  return f.is_open();
}

///FileToVector reads a file and converts it to a std::vector<std::string>
///From http://www.richelbilderbeek.nl/CppFileToVector.htm
std::vector<std::string> read_file_as_text(const std::string& filename)
{
  assert(file_exists(filename));
  std::vector<std::string> v;
  std::ifstream in(filename.c_str());
  for (int i=0; !in.eof(); ++i)
  {
    std::string s;
    std::getline(in,s);
    v.push_back(s);
  }
  return v;
}

constexpr int aa_to_int(const char c)
{
  return c - 'A';
}

constexpr int topo_to_int(const char c)
{
  return
    c == 'i' ? 0 :
      c == 'm' ? 1 :
        c == 'o' ? 2 :
          c == 'I' ? 3 :
            c == 'M' ? 4 :
              c == 'O' ? 5 : -1
  ;
}

int main()
{
  static_assert(aa_to_int('A') == 0);
  static_assert(aa_to_int('B') == 1);
  static_assert(aa_to_int('Z') == 25);
  static_assert(topo_to_int('i') == 0);
  static_assert(topo_to_int('m') == 1);
  static_assert(topo_to_int('o') == 2);
  static_assert(topo_to_int('I') == 3);
  static_assert(topo_to_int('M') == 4);
  static_assert(topo_to_int('O') == 5);

  const std::string tmhmm_filename{"UP000005640.tmhmm"};
  const std::string fasta_filename{"UP000005640.fasta"};

  const auto text_fasta = read_file_as_text(fasta_filename);
  const auto text_topo = read_file_as_text(tmhmm_filename);

  assert(text_fasta.size() == text_topo.size());
  const int n_lines = text_topo.size();
  std::vector<std::vector<int>> m(6, std::vector<int>(26, 0));
  for (int i = 0; i != n_lines; ++i)
  {
    const auto& fasta_line = text_fasta[i];
    if (fasta_line .empty()) continue;
    if (fasta_line[0] == '>') continue;
    const auto& topo_line = text_topo[i];
    assert(fasta_line.size() == topo_line.size());
    const int n_chars = fasta_line.size();
    for (int j = 0; j != n_chars; ++j)
    {
      const char aa = fasta_line[j];
      const int ai = aa_to_int(aa);
      assert(ai >= 0 && ai < 27);
      const char topo = topo_line[j];
      const int ti = topo_to_int(topo);
      assert(ti >= 0 && ti < 6);
      ++m[ti][ai];
    }
  }

  std::ofstream f("counts.csv");
  {
    f << "topo,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,nothing\n";
  }
  for (int i = 0; i != 6; ++i)
  {
    switch (i)
    {
      case 0: f << "i,"; break;
      case 1: f << "m,"; break;
      case 2: f << "o,"; break;
      case 3: f << "I,"; break;
      case 4: f << "M,"; break;
      case 5: f << "O,"; break;
    }
    const auto& line =  m[i];
    std::copy(std::begin(line), std::end(line), std::ostream_iterator<int>(f, ","));
    f << '0' << '\n';
  }
}

