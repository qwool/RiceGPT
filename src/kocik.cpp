/*
A simple C++ fetch, written by ChatGPT
Only human involvement is pasting
*/

#include <iostream>
#include <string>
#include <unistd.h>
#include <sys/utsname.h>
#include <time.h>
#include <fstream>
#include <unordered_map>

int main(int argc, char* argv[])
{
  // Get the system information
  utsname uname_info;
  uname(&uname_info);

  // Get the current time
  time_t current_time = time(NULL);
  struct tm* time_info = localtime(&current_time);

  // Open the /proc/meminfo file
  std::ifstream meminfo("/proc/meminfo");
  if (!meminfo) {
    std::cerr << "Error: Failed to open /proc/meminfo" << std::endl;
    return 1;
  }

  // Read the contents of the file into a map of key-value pairs
  std::unordered_map<std::string, long long> memvalues;
  std::string line;
  while (std::getline(meminfo, line)) {
    std::size_t pos = line.find(':');
    if (pos != std::string::npos) {
      std::string key = line.substr(0, pos);
      long long value;
      std::sscanf(line.substr(pos + 1).c_str(), "%lld kB", &value);
      memvalues[key] = value;
    }
  }
  // Display the system information
  std::cout << "          \033[1m"<< asctime(time_info);
  std::cout << "   /\\_/\\  ";  // Red text
  std::cout << "\033[1;31mOS: " << "\033[0m" << " " << uname_info.sysname << uname_info.release << std::endl;  // Reset text color
  std::cout << "  ( o.o ) ";  // Green text
  std::cout << "\033[1;32mHostname: " << "\033[0m" << uname_info.nodename << std::endl;  // Reset text color
  std::cout << "    >^<   ";  // Yellow text
  std::cout << "\033[1;33mMemory usage: " << "\033[0m" << memvalues["MemTotal"] /1024 - memvalues["MemFree"] /1024 << " MB / " << memvalues["MemTotal"] /1024 << " MB" << std::endl;  // Reset text color
  std::cout << "    / \\   ";  // Blue text
  std::cout << "\033[1;34mArchitecture: " << "\033[0m" << uname_info.machine << std::endl;  // Reset text color
  std::cout << "   /\\_/\\  ";  // Purple text
  std::cout << "\033[31m\u25A0 ";  // Red square
  std::cout << "\033[32m\u25A0 ";  // Green square
  std::cout << "\033[33m\u25A0 ";  // Yellow square
  std::cout << "\033[34m\u25A0 ";  // Blue square
  std::cout << "\033[35m\u25A0 ";  // Purple square
  std::cout << "\033[36m\u25A0 ";  // Cyan square
  std::cout << "\033[37m\u25A0 ";  // White square
  std::cout << "\033[0m\u25A0" << std::endl;  // Reset text color and print black square
  return 0;
}
