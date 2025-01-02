#ifndef PHASHMAP_TYPES_HPP
#define PHASHMAP_TYPES_HPP

#include <array>
#include <cstdint>
#include <string>

// 声明模板函数
template <typename T>
std::string type_name();

// 基本类型特化
template <> std::string type_name<uint8_t>() { return "u1"; }
template <> std::string type_name<uint16_t>() { return "u2"; }
template <> std::string type_name<uint32_t>() { return "u4"; }
template <> std::string type_name<uint64_t>() { return "u8"; }
template <> std::string type_name<int8_t>() { return "i1"; }
template <> std::string type_name<int16_t>() { return "i2"; }
template <> std::string type_name<int32_t>() { return "i4"; }
template <> std::string type_name<int64_t>() { return "i8"; }
template <> std::string type_name<float>() { return "f4"; }
template <> std::string type_name<double>() { return "f8"; }

// std::array<char, N> 特化
template <std::size_t N>
std::string type_name<std::array<char, N>>() {
    return "S" + std::to_string(N);
}

#endif // PHASHMAP_TYPES_HPP
