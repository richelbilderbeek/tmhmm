#include <string>

#include <cassert>
#include <fstream>
#include <vector>

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


int main()
{
  const std::string tmhmm_filename{"UP000005640.tmhmm"};
  const std::string fasta_filename{"UP000005640.fasta"};

  const auto text_fasta = read_file_as_text(fasta_filename);
  const auto text_topo = read_file_as_text(tmhmm_filename);

  assert(text_topo.size() == text_topo.size());

//Peptides::aaList()
//imoIMO


}

