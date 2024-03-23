# Compile and execute any assembly file
```nasm -f elf64 filename.asm && ld -o filename filename.o && ./filename```

# Compile and execute print_test.asm
```nasm -f elf64 print_test.asm && ld -o print_test print_test.o && ./print_test```

# Compile and execute print_numbers.asm
```nasm -f elf64 print_numbers.asm && ld -o print_numbers print_numbers.o && ./print_numbers```

# Compile and execute exp_2_files.asm
```nasm -f elf64 exp_2_files.asm && ld -o exp_2_files exp_2_files.o && ./exp_2_files```

# Multifile project
```nasm -f elf64 some_file.asm```
```nasm -f elf64 main.asm```
```ld some_file.o main.o -o main```