import subprocess

def install_specified_collections():
    collections = [
        "microsoft.ad",
        "community.hashi_vault",
        "community.general",
        "community.docker",
        "community.kubernetes",
        "community.routeros",
        "community.libvirt",
        "community.kubevirt",
        "community.zabbix",
        "community.mysql"
    ]

    for collection in collections:
        try:
            subprocess.run(['ansible-galaxy', 'collection', 'install', collection], check=True)
            print(f"Successfully installed collection: {collection}")
        except subprocess.CalledProcessError as e:
            print(f"Failed to install collection: {collection}. Error: {e}")

if __name__ == "__main__":
    install_specified_collections()
