# Linux† TOSZ Utility

## Usage
```
TOSZ [-ascii] filename
```

Will uncompress a single file from within Linux.  The `-ascii` flag will convert 
the irregular TempleOS ASCII 5 and ASCII 31 characters to spaces.  (ASCII 5 is 
used to mark the cursor pos and ASCII 31 is used for shifted space characters 
and will cause problems unless you convert them.)

----
† "Linux" is a trademark owned by Linus Torvalds.

## License of TempleOS
```
I, Terry A. Davis, wrote all of TempleOS over the past 14.7 years (full-time).  
It can run on some bare metal 64-bit PC's from about 2005-2010 with no layering, 
libraries, tools, modules or anything from other sources.  Otherwise, you run it 
in a virtual machine, like VMware, QEMU or VirtualBox.  It is independent and 
stands alone.  It has no networking, so it certainly doesn't call home.  100% of 
the src code is including on all distro's, from the kernel to the compiler to 
the boot loaders!  It is public domain, not GPL.
```

## License of this repository (Makefile, README)
In accordance with Terry's above-stated wishes, my‡ modifications are likewise
in the public domain.

‡ Fredrick R. Brennan &lt;copypaste @ kittens . ph&gt;
