#  Criando o USB de instalação
* Usando o processo sugerido por Patrick Volkering descrito (aqui)[http://slackware.osuosl.org/slackware/isolinux/README.TXT]
< HOW TO MAKE A BOOTABLE SLACKWARE DVD ISO IMAGE

To make a bootable Slackware install DVD, get into the top level Slackware
directory (The one with ChangeLog.txt in it) and issue a command like this
to build the ISO image in /tmp:

mkisofs -o /tmp/slackware-dvd.iso \
  -R -J -A "Slackware Install" \
  -hide-rr-moved \
  -v -d -N \
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  -sort isolinux/iso.sort \
  -b isolinux/isolinux.bin \
  -c isolinux/isolinux.boot \
  -m 'source' \
  -V "SlackDVD" .

As an additional step, the ISO image may be processed to make it bootable
when written to a USB stick.  This processing will not impact the ISO's
ability to boot from DVD media.  Use the following command to do this:

isohybrid /tmp/slackware-dvd.iso

On my system, here's the command I'd use to burn the resulting DVD ISO:

growisofs -speed=2 -dvd-compat -Z /dev/sr0=slackware-dvd.iso

If your burner is not /dev/sr0, replace the device with the one your
system uses.

I find discs burned at 2x are more reliable than ones burned at higher
speeds, but you may see completely different results depending on media
and burner type.  The -dvd-compat option is also used so that a complete
lead-out is written to the media for maximum compatibility.

To write the ISO image to a USB stick (process with isohybrid first, as
shown above), use a command such as this (replace /dev/sdX with the device
name for your USB stick):

dd if=/tmp/slackware-dvd.iso of=/dev/sdX bs=1M
(...) >

# Fazendo boot pelo USB
* **deathstar:** direto na BIOS.
* **naberrie:** na BIOS, desabilite a opção Fast Boot e Securet Boot, plug o USB, reboot e acesse a BIOS novamente.

# Instalando o Slackware
* Carregue o kernel huge.s
* Selecione o teclado (qwerty/br-abnt2.map)
* Login como root
* < fdisk /dev/sda > 
## Particionamento em **naberrie**
Particionamento 
* /dev/sda1 
