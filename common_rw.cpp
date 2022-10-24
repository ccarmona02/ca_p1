/* File containing common functions for SOA and AOS reading and writing methods */

#include "common.cpp"
#include "common_rw.hpp"
#include <iostream>
#include <fstream>

void read_type(std::ifstream &f)
// Reads and checks that the encoded filetype is a bitmap
{
    uint8_t file_type_B;
    uint8_t file_type_M;

    f.read(reinterpret_cast<char *>(&file_type_B), sizeof(unsigned char));
    if (file_type_B != 'B')
    {
        err_msg(ErrorType::wrong_type);
    }

    f.read(reinterpret_cast<char *>(&file_type_M), sizeof(unsigned char));
    if (file_type_M != 'M')
    {
        err_msg(ErrorType::wrong_type);
    }
}

void check_validity(std::ifstream &f)
// Checks if the bitmap is valid
{
    uint16_t planes, point_size;
    f.read(reinterpret_cast<char *>(&planes), sizeof(uint16_t));

    if (static_cast<int>(planes) != 1)
    {
        err_msg(ErrorType::wrong_planes);
    }

    f.read(reinterpret_cast<char *>(&point_size), sizeof(uint16_t));

    if (static_cast<int>(point_size) != 24)
    {
        err_msg(ErrorType::wrong_point_size);
    }

    uint32_t compression;
    f.read(reinterpret_cast<char *>(&compression), sizeof(unsigned int));

    if (static_cast<int>(compression) != 0)
    {
        err_msg(ErrorType::wrong_compression);
    }
}

Header read_header(const std::filesystem::path &path)
// Reads the values in the header of a valid bitmap and returns them in a structure
{
    Header h{};
    std::ifstream f;
    f.open(path, std::ios::in | std::ios::binary);

    if (!f.is_open())
    {
        err_msg(ErrorType::unopened_file);
    }

    read_type(f);

    f.read(reinterpret_cast<char *>(&h.file_size), sizeof(unsigned int));

    f.ignore(sizeof(unsigned int));   // Skip the reserved field

    f.read(reinterpret_cast<char *>(&h.img_start), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.header_size), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.img_width), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.img_height), sizeof(unsigned int));

    check_validity(f);

    // FIXME: These values are not read correctly (from h_res onwards, they are all read as 0)
    f.read(reinterpret_cast<char *>(&h.image_size), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.h_res), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.v_res), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.ctable_size), sizeof(unsigned int));
    f.read(reinterpret_cast<char *>(&h.ccounter), sizeof(unsigned int));

    return h;
}

void write_header(std::filesystem::path &path, Header header)
// Writes a (valid) bitmap header in the specified directory using a given header structure
{
    std::ofstream f;
    f.open(path, std::ios::out | std::ios::binary);

    if (!f.is_open())
    {
        err_msg(ErrorType::unopened_file);
    }

    unsigned char file_type[2];
    file_type[0] = 'B';
    file_type[1] = 'M';
    f.write(reinterpret_cast<const char *>(&file_type[0]), sizeof(file_type[0]));
    f.write(reinterpret_cast<const char *>(&file_type[1]), sizeof(file_type[1]));

    f.write(reinterpret_cast<const char *>(&header.file_size), sizeof(unsigned int));

    f.seekp(10);    // Skip the reserved field

    f.write(reinterpret_cast<const char *>(&header.img_start), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.header_size), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.img_width), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.img_height), sizeof(unsigned int));

    int valid_values[] = {1, 24, 0};
    f.write(reinterpret_cast<const char *>(&valid_values[0]), sizeof(unsigned int));    // Number of plains: 1
    f.write(reinterpret_cast<const char *>(&valid_values[1]), sizeof(unsigned int));    // Point size in bits: 24
    f.write(reinterpret_cast<const char *>(&valid_values[2]), sizeof(unsigned int));    // Compression: 0

    f.write(reinterpret_cast<const char *>(&header.image_size), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.h_res), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.v_res), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.ctable_size), sizeof(unsigned int));
    f.write(reinterpret_cast<const char *>(&header.ccounter), sizeof(unsigned int));
}
