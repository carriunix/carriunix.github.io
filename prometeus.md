##  Criando o USB de instalação
* Usando o processo sugerido por Patrick Volkering descrito [aqui.](http://slackware.osuosl.org/slackware/isolinux/README.TXT)
>HOW TO MAKE A BOOTABLE SLACKWARE DVD ISO IMAGE
>
>To make a bootable Slackware install DVD, get into the top level Slackware
>directory (The one with ChangeLog.txt in it) and issue a command like this
>to build the ISO image in /tmp:
>
>mkisofs -o /tmp/slackware-dvd.iso \
>  -R -J -A "Slackware Install" \
>  -hide-rr-moved \
>  -v -d -N \
>  -no-emul-boot -boot-load-size 4 -boot-info-table \
>  -sort isolinux/iso.sort \
>  -b isolinux/isolinux.bin \
>  -c isolinux/isolinux.boot \
>  -m 'source' \
>  -V "SlackDVD" .
>
>As an additional step, the ISO image may be processed to make it bootable
>when written to a USB stick.  This processing will not impact the ISO's
>ability to boot from DVD media.  Use the following command to do this:
>
>isohybrid /tmp/slackware-dvd.iso
>
>On my system, here's the command I'd use to burn the resulting DVD ISO:
>
>growisofs -speed=2 -dvd-compat -Z /dev/sr0=slackware-dvd.iso
>
>If your burner is not /dev/sr0, replace the device with the one your
>system uses.
>
>I find discs burned at 2x are more reliable than ones burned at higher
>speeds, but you may see completely different results depending on media
>and burner type.  The -dvd-compat option is also used so that a complete
>lead-out is written to the media for maximum compatibility.
>
>To write the ISO image to a USB stick (process with isohybrid first, as
>shown above), use a command such as this (replace /dev/sdX with the device
>name for your USB stick):
>
>dd if=/tmp/slackware-dvd.iso of=/dev/sdX bs=1M
>(...)

## Fazendo boot pelo USB
* **deathstar:** direto na BIOS.
* **naberrie:** na BIOS, desabilite a opção Fast Boot e Securet Boot, plug o USB, reboot e acesse a BIOS novamente.

## Preparando instalação do Slackware
* Carregue o kernel huge.s
* Selecione o teclado (qwerty/br-abnt2.map)
* Login como root
> fdisk /dev/sda 

### Particionamento em **naberrie**
* Particionamento em GPT disk por causa do UEFI

Partição   | Diretório | Tamanho | Formato
--------- | --------- | --------- | ---------
/dev/sda1   | EFI | 250M | EFI
/dev/sda2   | swap | 10Gb | Linux swap
/dev/sda3  | / | 40Gb | Linux filesystem
/dev/sda4   | /pkgs | 40Gb | Linux filesystem
/dev/sda5   | /home | 133Gb | Linux filesystem

### Particionamento em **deathstar**
* (loading...)

## Fazendo a instalação...
> setup
* Selecione o teclado (qwerty/br-abnt2.map)
* Confirme a partição swap
* Indique as partições conforme a tabela de particionamento
* Indique o USB como source
* Confirme a instalação padrão
* Selecione o modo de prompting _terse_
* Pule a criação de um USB boot stick

Em **deathstar**:
* Instale o LILO
* Selecione o mouse _imps2_
* Configure a rede com host _deathstar_ , domain _padme_ e protocolo DHCP.

Em **naberrie**:
* Pule a instalação do LILO e instale o ELILO
* Selecione o mouse _imps2_
* Configure a rede com host _naberrie_ , domain _padme_ e protocolo DHCP.

* Confirme os serviços de inicialização padrão
* Escolha a fonte customizada: _ter-116n_
* Selecione o hardware clock para _local time_ e timezone em _America/Sao_Paulo_
* Confirme o editor ex/vi padrão
* Selecione o _fluxbox_ como window manager
* Selecione a senha de root
* Reinicie o computador

## Atualizando softwares
* Edite o arquivo /etc/slackpkg/mirrors para selecionar um mirror
>slackpkg update gpg
>slackpkg update
>slackpkg upgrade slackpkg
>slackpkg new-config
>slackpkg upgrade glibc-solibs
>slackpkg install-new
>slackpkg upgrade-all
>slackpkg clean-system

## Arquivos de configuração
* Copie os rcscripts (rc.M, rc.local, rc.local_shutdown, rc.updates) para /etc/rc.d/
* Copie o script boottime para /usr/local/sbin/ e dê permissão de executável
* Prepare o sistema para hibernação: adicione a linha abaixo em /boot/efi/EFI/Slackware/elilo.conf
> append="resume=/dev/sda2"

* Copie o arquivo acpi_handler.sh para /etc/acpi/

#


