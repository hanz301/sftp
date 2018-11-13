bindMount=$(mount --bind /home/sftp/groupshare/ /home/$users/groupShare/);
chmod u=r,g=rwx,o= /home/sftp/groupshare/

#Creates groupShare for all users in /home/, except if user is named sftp

for users in $(ls /home)
do 		
if [ $users != "sftp" ];
then 
    $bindMount && echo "Created groupShare for $users"
fi; 
done
