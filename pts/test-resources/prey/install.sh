#!/bin/sh

unzip -o prey-installer-02192009.bin
rm -rf guis/
rm -rf meta/
rm -rf scripts/

tar -C .prey/base/ -jxf prey-retail-client-pts-1.tar.bz2
mv data/prey-linux-data/base/* data/prey-linux-x86/base

if [ -f prey-base-files.tar ]
  then
     tar -C data/prey-linux-x86/base/ -k -xvf prey-base-files.tar
  else
     echo "Prey Retail Game Files (*.pk4) Must Be Copied Into $HOME/data/prey-linux-x86/base/"
fi

mkdir -p $DEBUG_REAL_HOME/.prey/base/
if [ -f preykey.tar ]
  then
     tar -C $DEBUG_REAL_HOME/.prey/base/ -xvf preykey.tar
  else
     echo "Copy Your Game Key File To $DEBUG_REAL_HOME/.prey/base/preykey"
fi

echo "#!/bin/sh
cd data/prey-linux-x86/
./prey.x86 \$@ > \$LOG_FILE
cat \$LOG_FILE | grep fps" > prey
chmod +x prey
