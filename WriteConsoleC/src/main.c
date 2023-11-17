#include <Windows.h>

int main(int argc, char *argv[]) {
  HANDLE hConsole;

  hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
  if (hConsole == INVALID_HANDLE_VALUE) {
    return 1;
  }

  const char *str = "Hello World!";
  DWORD bytesWritten;

  BOOL success = WriteConsole(hConsole, str, strlen(str), &bytesWritten, NULL);
  if (!success) {
    return 1;
  }

  return 0;
}
