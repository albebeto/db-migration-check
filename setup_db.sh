# Set db in keystone.conf
sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/keystone\/keystone.db/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/keystone/" "/etc/keystone/keystone.conf"

# Set db in glance.conf
sed -i -e "s/#connection = <None>/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/glance/" "/etc/glance/glance-api.conf"

#Set db in nova.conf
echo "[database]" >> /etc/nova/nova.conf
echo "connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/nova" >> /etc/nova/nova.conf
echo "[api_database]" >> /etc/nova/nova.conf
echo "connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/nova_api" >> /etc/nova/nova.conf

#Set db in cinder.conf
echo "[database]"  >> /etc/cinder/cinder.conf
echo "connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/cinder" >> /etc/cinder/cinder.conf

#Set db in neutron.conf
sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/neutron\/neutron.sqlite/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/neutron/" "/etc/neutron/neutron.conf"

