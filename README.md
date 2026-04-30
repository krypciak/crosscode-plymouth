# CrossCode plymouth
[CrossCode](https://cross-code.com) themed plymouth theme

SCREENSHOT

## Installation

NOTE: Instructions for Arch Linux  

### initramfs flags

Add `plymouth` to `HOOKS` after `udev`:  
`/etc/mkinitcpio.conf`:  
```
HOOKS=(base udev plymouth keyboard ...)
```

Remember to regenerate initramfs:
```bash
mkinitcpio -P
```

### Kernel parameters

You have to add the `quiet splash` parameters, the other flags are my recommendations for a more flicker-free experience.  
For example with GRUB:  
`/etc/default/grub`:  
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash vt.global_cursor_default=0 loglevel=3 systemd.show_status=0 rd.udev.log_level=3 fbcon=nodefer"
```

Remember to regenerate GRUB config:
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### Theme installation - from source

- Clone the repository
```bash
git clone https://github.com/krypciak/crosscode-plymouth
```

- Run the installation script as root
```bash
sudo bash ./install.sh
```

- Done!

- If you want, you can preview the theme (works only on X11, doesn't work through xwayland):
```
sudo bash ./preview.sh
```



## Screenshots
