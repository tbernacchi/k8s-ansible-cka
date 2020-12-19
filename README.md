<h1 align="">k8s-ansible-cka 👋</h1>
<p>
</p>

> Kubernetes cluster 1.13 setup with Docker 18.06.3 on Vagrant

![Kubernetes](/.github/assets/img/kubernetes-logo.png)

<div align=>
	<img align="right" width="200px" src=/.github/assets/img/docker-logo.png>
</div> 

## Table of Contents

* **Kubernetes**  
  * [Official Website](https://kubernetes.io)
  * [Official Docs](https://kubernetes.io/docs/home/)
  * [Official Github](https://github.com/kubernetes)
* **Docker**  
  * [Offical Website](https://www.docker.com/)
  * [Offical Docs](https://docs.docker.com/)
  * [Official Github](https://github.com/docker)

## Requirements
* Vagrant 2.2.6

## Usage

```
vagrant up 
```

```
ansible-playbook -i hosts main.yml --limit teste --tags "common"
ansible-playbook -i hosts main.yml --limit teste --tags "master"
ansible-playbook -i hosts main.yml --limit workers --tags "workers"
```

## Author

👤 **Tadeu Bernacchi**

* Website: http://www.tadeubernacchi.com.br/
* Twitter: [@tadeuuuuu](https://twitter.com/tadeuuuuu)
* Github: [@tbernacchi](https://github.com/tbernacchi)
* LinkedIn: [@tadeubernacchi](https://linkedin.com/in/tadeubernacchi)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
