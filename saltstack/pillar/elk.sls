elk:

  elastic:
    public_key_url: https://packages.elastic.co/GPG-KEY-elasticsearch
    public_key_path: /root/GPG-KEY-elasticsearch.pub
    public_key: |+
      -----BEGIN PGP PUBLIC KEY BLOCK-----
      Version: GnuPG v2.0.14 (GNU/Linux)

      mQENBFI3HsoBCADXDtbNJnxbPqB1vDNtCsqhe49vFYsZN9IOZsZXgp7aHjh6CJBD
      A+bGFOwyhbd7at35jQjWAw1O3cfYsKAmFy+Ar3LHCMkV3oZspJACTIgCrwnkic/9
      CUliQe324qvObU2QRtP4Fl0zWcfb/S8UYzWXWIFuJqMvE9MaRY1bwUBvzoqavLGZ
      j3SF1SPO+TB5QrHkrQHBsmX+Jda6d4Ylt8/t6CvMwgQNlrlzIO9WT+YN6zS+sqHd
      1YK/aY5qhoLNhp9G/HxhcSVCkLq8SStj1ZZ1S9juBPoXV1ZWNbxFNGwOh/NYGldD
      2kmBf3YgCqeLzHahsAEpvAm8TBa7Q9W21C8vABEBAAG0RUVsYXN0aWNzZWFyY2gg
      KEVsYXN0aWNzZWFyY2ggU2lnbmluZyBLZXkpIDxkZXZfb3BzQGVsYXN0aWNzZWFy
      Y2gub3JnPokBOAQTAQIAIgUCUjceygIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgEC
      F4AACgkQ0n1mbNiOQrRzjAgAlTUQ1mgo3nK6BGXbj4XAJvuZDG0HILiUt+pPnz75
      nsf0NWhqR4yGFlmpuctgCmTD+HzYtV9fp9qW/bwVuJCNtKXk3sdzYABY+Yl0Cez/
      7C2GuGCOlbn0luCNT9BxJnh4mC9h/cKI3y5jvZ7wavwe41teqG14V+EoFSn3NPKm
      TxcDTFrV7SmVPxCBcQze00cJhprKxkuZMPPVqpBS+JfDQtzUQD/LSFfhHj9eD+Xe
      8d7sw+XvxB2aN4gnTlRzjL1nTRp0h2/IOGkqYfIG9rWmSLNlxhB2t+c0RsjdGM4/
      eRlPWylFbVMc5pmDpItrkWSnzBfkmXL3vO2X3WvwmSFiQbkBDQRSNx7KAQgA5JUl
      zcMW5/cuyZR8alSacKqhSbvoSqqbzHKcUQZmlzNMKGTABFG1yRx9r+wa/fvqP6OT
      RzRDvVS/cycws8YX7Ddum7x8uI95b9ye1/Xy5noPEm8cD+hplnpU+PBQZJ5XJ2I+
      1l9Nixx47wPGXeClLqcdn0ayd+v+Rwf3/XUJrvccG2YZUiQ4jWZkoxsA07xx7Bj+
      Lt8/FKG7sHRFvePFU0ZS6JFx9GJqjSBbHRRkam+4emW3uWgVfZxuwcUCn1ayNgRt
      KiFv9jQrg2TIWEvzYx9tywTCxc+FFMWAlbCzi+m4WD+QUWWfDQ009U/WM0ks0Kww
      EwSk/UDuToxGnKU2dQARAQABiQEfBBgBAgAJBQJSNx7KAhsMAAoJENJ9ZmzYjkK0
      c3MIAIE9hAR20mqJWLcsxLtrRs6uNF1VrpB+4n/55QU7oxA1iVBO6IFu4qgsF12J
      TavnJ5MLaETlggXY+zDef9syTPXoQctpzcaNVDmedwo1SiL03uMoblOvWpMR/Y0j
      6rm7IgrMWUDXDPvoPGjMl2q1iTeyHkMZEyUJ8SKsaHh4jV9wp9KmC8C+9CwMukL7
      vM5w8cgvJoAwsp3Fn59AxWthN3XJYcnMfStkIuWgR7U2r+a210W6vnUxU4oN0PmM
      cursYPyeV0NX/KQeUeNMwGTFB6QHS/anRaGQewijkrYYoTNtfllxIu9XYmiBERQ/
      qPDlGRlOgVTd9xUfHFkzB52c70E=
      =92oX
      -----END PGP PUBLIC KEY BLOCK-----

  elasticsearch:
    apt_source: http://packages.elastic.co/elasticsearch/2.x/debian

  logstash:
    documentation_source: https://www.elastic.co/guide/en/logstash/current/installing-logstash.html
    apt:
      apt_signing_key: wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      apt_transport_https: sudo apt-get install apt-transport-https
      repository_definition: echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
      logstash_install: sudo apt-get update && sudo apt-get install logstash
      apt_source: http://packages.elastic.co/logstash/2.2/debian
    yum:
      rpm_import: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
      rpm_repo: |+
        [logstash-5.x]
        name=Elastic repository for 5.x packages
        baseurl=https://artifacts.elastic.co/packages/5.x/yum
        gpgcheck=1
        gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
        enabled=1
        autorefresh=1
        type=rpm-md
      rpm_install:
        sudo yum install logstash
    direct_download: https://artifacts.elastic.co/downloads/logstash/logstash-5.2.1.tar.gz
    logstash_source: https://www.elastic.co/downloads/logstash
    logstash_run_command: bin/logstash -f logstash.conf
    logstash_parsing_info: https://www.elastic.co/guide/en/logstash/current/advanced-pipeline.html

  kibana:
    source: https://download.elastic.co/kibana/kibana/kibana-4.4.2-linux-x64.tar.gz
    source_hash: sha1=6251dbab12722ea1a036d8113963183f077f9fa7
    dir: /opt/kibana-4.4.2-linux-x64

  filebeat:
    source: https://download.elastic.co/beats/filebeat/filebeat-1.1.2-x86_64.tar.gz
    source_hash: sha1=7bc318ad2f770063335cbf0898c273fee2261062
    dir: /opt/filebeat-1.1.2-x86_64
