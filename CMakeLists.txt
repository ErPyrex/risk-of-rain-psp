cmake_minimum_required(VERSION 3.15)
project(GamePort C)

set(CMAKE_C_STANDARD 99)

include_directories(include)

add_executable(game_host
    src/main.c
)
