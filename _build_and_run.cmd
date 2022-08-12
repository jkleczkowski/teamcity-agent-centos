@rem docker build -t arti.ksoft.biz/docker-local/team-city/teamcity-agent-dotnet-core:latest .
@rem 
docker build -t jkleczkowski/teamcity-agent:centos8 .

@rem docker rm tca --force

@rem docker run --rm --name tca -v c:/DockerBuildAgent/conf:/data/teamcity_agent/conf -v c:/DockerBuildAgent/work:/opt/buildagent/work -e SERVER_URL=https://teamcity.ksoft.biz/ jkleczkowski/teamcity-agent:centos8

@rem docker tag jkleczkowski/teamcity-agent-dotnet-core:next jkleczkowski/teamcity-agent-dotnet-core:latest
@rem docker push jkleczkowski/teamcity-agent:centos8
