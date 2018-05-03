# Set db in keystone.conf
#RUN sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/keystone\/keystone.db/connection = mysql:\/\/root:my-secret-pw@127.0.0.1\/keystone/" "/etc/keystone/keystone.conf"
sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/keystone\/keystone.db/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/keystone/" "/etc/keystone/keystone.conf"

# Set db in glance.conf
#RUN sed -i -e "s/#connection = <None>/connection = mysql:\/\/root:my-secret-pw@127.0.0.1\/glance/" "/etc/glance/glance-api.conf"
sed -i -e "s/#connection = <None>/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/glance/" "/etc/glance/glance-api.conf"

#Set db in nova.conf
echo "[database] \n\
connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/nova" >> /etc/nova/nova.conf
echo "[api_database] \n\
connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/nova_api" >> /etc/nova/nova.conf

#Set db in cinder.conf
#RUN echo "[database] \n\
#connection = mysql://root:my-secret-pw@127.0.0.1/cinder" >> /etc/cinder/cinder.conf
echo "[database] \n\
connection = mysql://root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}/cinder" >> /etc/cinder/cinder.conf

#Set db in neutron.conf
#RUN sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/neutron\/neutron.sqlite/connection = mysql:\/\/root:my-secret-pw@127.0.0.1\/neutron/" "/etc/neutron/neutron.conf"
sed -i -e "s/connection = sqlite:\/\/\/\/var\/lib\/neutron\/neutron.sqlite/connection = mysql:\/\/root:${MYSQL_ROOT_PASSWORD}@${OPENSTACK_DB_HOST}\/neutron/" "/etc/neutron/neutron.conf"

