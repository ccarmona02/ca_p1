#ifndef CA_P1_SOA_HPP
#define CA_P1_SOA_HPP

#include "common_rw.hpp"
#include <filesystem>
#include <vector>

struct Image// SOA we use to represent an image
{
    std::vector<uint8_t> r;
    std::vector<uint8_t> g;
    std::vector<uint8_t> b;
};

void write_bmp(std::filesystem::path &path, const Header &header, Image image);

void frequencies (const std::vector<uint8_t> &color, std::ofstream& f);

void histogram (const Image &img);

std::vector<int> getmim (int i, int j, const Header &h, const std::vector<uint8_t> &color);

int getres (int i, int j, const Header &h, const std::vector<uint8_t> &color);

Image gauss (const Image &img, const Header &h);

#endif//CA_P1_SOA_HPP
