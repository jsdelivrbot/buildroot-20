#!/bin/bash

pushd output/build/linux-custom/; \
gdb \
 	-ex "add-auto-load-safe-path $(pwd)" \
	-ex "file vmlinux" \
	-ex 'set arch i386:x86-64:intel' \
	-ex 'target remote localhost:1234' \
	-ex 'hbreak start_kernel' \
	-ex 'continue' \
	-ex 'disconnect' \
	-ex 'set arch i386:x86-64' \
	-ex 'target remote localhost:1234' \
popd

# gdb \
# 	-ex "add-auto-load-safe-path $(pwd)" \
# 	-ex "file $(pwd)/output/build/linux-custom/vmlinux" \
# 	-ex 'set arch i386:x86-64:intel' \
# 	-ex 'target remote localhost:1234' \
# 	-ex 'break start_kernel' \
# 	-ex 'continue' \
# 	-ex 'disconnect' \
# 	-ex 'set arch i386:x86-64' \
# 	-ex 'target remote localhost:1234' \
# 	-ex "lx-symbols"; \
