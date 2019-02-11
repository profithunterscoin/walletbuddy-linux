echo "Wallet Buddy - PHC Wallet Setup (Ubuntu/Mint Linux)"
echo "Build: Feb 11 2019"

read -p "Install Dependencies? [Yy/Nn] " answer

	case $answer in
   		[yY]* )
		sudo apt-get update -y
		sudo apt-get upgrade -y
		sudo apt-get install build-essential -y
		sudo apt-get install libssl-dev -y
		sudo apt-get install libboost-all-dev -y
		sudo apt-get install libqrencode-dev -y
		sudo apt-get install libgmp-dev -y
		sudo apt-get install miniupnpc -y
		sudo apt-get install libminiupnpc-dev -y
		sudo apt-get install libcurl4-openssl-dev -y
		sudo apt-get install dh-autoreconf -y
		sudo apt-get install autoconf -y
		sudo apt-get install automake -y
		sudo apt-get install git nano -y
		sudo apt-get install pkg-config -y
		sudo apt-get install libtool -y
		sudo apt-get install libtool-bin -y
		sudo apt-get install libgmp-dev -y
		sudo apt-get install software-properties-common -y
	esac


read -p "Install DB 4.8 Dependencies? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		sudo add-apt-repository ppa:bitcoin/bitcoin -y
		sudo apt-get update -y
		sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
	esac


read -p "Install QT Dependencies? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		sudo apt-get install qt5-base -y
		sudo apt-get install qt5-default -y
		sudo apt-get install qt5-qmake -y
		sudo apt-get install qtbase5-dev-tools -y
		sudo apt-get install qttools5-dev-tools -y
		sudo apt-get install build-essential -y
		sudo apt-get install libboost-dev -y
		sudo apt-get install libboost-system-dev -y
		sudo apt-get install libboost-filesystem-dev -y
		sudo apt-get install libboost-program-options-dev -y
		sudo apt-get install libboost-thread-dev -y
		sudo apt-get install libssl-dev -y
		sudo apt-get install libminiupnpc-dev -y
		sudo apt-get install libjson-c-dev -y
	esac


read -p "Git Clone Source?  [Yy/Nn]" answer

	case $answer in
		[yY]* )
            rm phc -R -f                
            git clone https://github.com/profithunterscoin/phc.git
        esac

cd phc/src

read -p "Compile Daemon? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		make -f makefile.unix
        esac

read -p "Install Daemon to /usr/bin? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		sudo cp phcd /usr/bin
	esac

cd ..

read -p "Compile QT? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                qmake && make

	esac

read -p "Install QT to /usr/bin? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                sudo cp phc-qt /usr/bin
        esac

read -p "Create PHC Datadir? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                mkdir /home/$USER/.PHC
                echo "Created: /home/$USER/.PHC"
        esac

read -p "Create PHC Datadir (Testnet)? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                mkdir /home/$USER/.PHC/testnet
                echo "Created: /home/$USER/.PHC/testnet"
        esac

read -p "Create phc.conf with random user/password? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                username="$RANDOM"
                password="$RANDOM"
		        echo -e "rpcuser=$username\n" >> /home/$USER/.PHC/phc.conf
		        echo -e "rpcpassword=$password\n" >> /home/$USER/.PHC/phc.conf

                echo "Username: $username"
                echo "Password: $password"
        esac

read -p "Append to phc.conf with listen, server, daemon options enabled? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		        echo -e "listen=1\n" >> /home/$USER/.PHC/phc.conf
		        echo -e "server=1\n" >> /home/$USER/.PHC/phc.conf
		        echo -e "daemon=1\n" >> /home/$USER/.PHC/phc.conf

                echo "Listen, server, daemon options ENABLED"
        esac


read -p "Create phc.conf (testnet) with random user/password? [Yy/Nn] " answer

        case $answer in
                [yY]* )
                username="$RANDOM"
                password="$RANDOM"
		        echo -e "rpcuser=$username\n" >> /home/$USER/.PHC/testnet/phc.conf
		        echo -e "rpcpassword=$password\n" >> /home/$USER/.PHC/testnet/phc.conf

                echo "Username: $username"
                echo "Password: $password"
        esac

read -p "Append to phc.conf (testnet) with listen, server, daemon options enabled? [Yy/Nn] " answer

        case $answer in
                [yY]* )
		        echo -e "listen=1\n" >> /home/$USER/.PHC/testnet/phc.conf
		        echo -e "server=1\n" >> /home/$USER/.PHC/testnet/phc.conf
		        echo -e "daemon=1\n" >> /home/$USER/.PHC/testnet/phc.conf

                echo "Listen, server, daemon options ENABLED"
        esac


echo "Setup completed... Thank you."
