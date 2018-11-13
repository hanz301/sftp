bindMount=$(mount --bind /home/sftp/groupshare/ /home/$users/groupShare/);


chmod u=r,g=rwx,o= /home/sftp/groupshare/

for users in $(ls /home)
do 		
if [ $users != "sftp" ];
then 
    $bindMount && echo "Created groupShare for $users"
fi; 
done
