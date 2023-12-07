# Objectif : exécuter un fichier Python, peu importe le provider 🎯🐍🔍




## Provisionneur file : 📁
Le provisionneur file est utilisé pour copier des fichiers ou des répertoires de la machine locale vers une machine distante. C'est utile pour déployer des fichiers de configuration, des scripts ou d'autres ressources sur une instance provisionnée.


Exemple :
```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

provisioner "file" {
  source      = "local/path/to/localfile.txt"
  destination = "/path/on/remote/instance/file.txt"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }
}
```


Dans cet exemple, le provisionneur file copie le localfile.txt de la machine locale vers l'emplacement /path/on/remote/instance/file.txt sur l'instance EC2 AWS en utilisant une connexion SSH.


## Provisionneur remote-exec : 🌐
Le provisionneur remote-exec est utilisé pour exécuter des scripts ou des commandes sur une machine distante via des connexions SSH ou WinRM. Il est souvent utilisé pour configurer ou installer des logiciels sur des instances provisionnées.

Exemple :
```hcl

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

provisioner "remote-exec" {
  inline = [
    "sudo yum update -y",
    "sudo yum install -y httpd",
    "sudo systemctl start httpd",
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.example.public_ip
  }
}```

Dans cet exemple, le provisionneur remote-exec se connecte à l'instance EC2 AWS en utilisant SSH et exécute une série de commandes pour mettre à jour les dépôts de paquets, installer le serveur HTTP Apache et démarrer le serveur HTTP.

## provisionneur local-exec : 💻
Le provisionneur local-exec est utilisé pour exécuter des scripts ou des commandes localement sur la machine où Terraform est exécuté. Il est utile pour des tâches qui ne nécessitent pas d'exécution à distance, comme l'initialisation d'une base de données locale ou la configuration de ressources locales.
Exemple :
```hcl

resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'Ceci est une commande locale'"
  }
}
```
Dans cet exemple, une null_resource est utilisée avec un provisionneur local-exec pour exécuter une commande locale simple qui affiche un message dans la console chaque fois que Terraform est appliqué ou actualisé. La fonction timestamp() garantit son exécution à chaque fois.