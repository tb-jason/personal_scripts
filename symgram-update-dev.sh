# Last updated: 2022-09-15

aws codebuild batch-get-projects --profile symgram-dev --names $(aws codebuild list-projects --profile symgram-dev | jq -r '.projects[]') > symgram-projects-dev.json
jq -r '.projects[] | select(.environment.environmentVariables[] | contains({name: "KUBERNETES_VERSION"})) | {name: .name, environment: .environment} | (.environment.environmentVariables[] | select(.name == "KUBERNETES_VERSION")).value = "1.21.2/2021-07-05"' symgram-projects-dev.json > symgram-projects-toUpdate-dev

# Manually edit symgram-projects-toUpdate-dev into a .json file (Turn it into an array with [] and },)


jq -c '.[]' symgram-projects-toUpdate-dev.json | while read i; do
  NAME=$(echo $i | jq -r '.name')
  echo $NAME
  ENVIRONMENT=$(echo $i | jq -r '.environment')
  #echo $ENVIRONMENT
  
  #aws codebuild update-project --profile symgram-dev --name $NAME --environment "$ENVIRONMENT"
  #exit
done
