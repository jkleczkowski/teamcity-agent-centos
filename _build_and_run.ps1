Write-Host "Preaparing files"
if (-not (Test-Path -Path ".\root\bin\kubectl") ) {


    $kubeVer = Invoke-WebRequest https://storage.googleapis.com/kubernetes-release/release/stable.txt | Select-Object $_.Content

    $kubeUrl = "https://storage.googleapis.com/kubernetes-release/release/$kubeVer/bin/linux/amd64/kubectl"
    Write-Host "Kubectl Url:", $kubeUrl

    New-Item -ItemType Directory -Path "./root/bin/" -Force

    Invoke-WebRequest -Uri $kubeUrl -OutFile "./root/bin/kubectl"
    Write-Host "Kubectl downloaded"
}
else {
    Write-Host "Kubectl already downloaded"
}

Write-Host "Building image"

docker build -t jkleczkowski/teamcity-agent:cenetos . --pull


# docker run --rm --name tca -v c:/DockerBuildAgent/conf:/data/teamcity_agent/conf -v c:/DockerBuildAgent/work:/opt/buildagent/work -e SERVER_URL=https://teamcity.ksoft.biz/ jkleczkowski/teamcity-agent:centos8
