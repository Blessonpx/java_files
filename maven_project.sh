#!/bin/bash

#mvn archetype:generate -DgroupId=com.example -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

# Prompt user for first string variable
read -p "Archetype:(eg. generate ) " archetype_

# Prompt user for second string variable
read -p "group_id:(eg. com.bpx) " groupID_

read -p "artifactID:(eg. myapp)" artifactID_

# Prompt user for a selection from three options
echo "archetypeArtifactID:"
options=("maven-archetype-quickstart" "maven-archetype-simple")

select selected_option in "${options[@]}"; do
    if [[ -n "$selected_option" ]]; then
        break
    else
        echo "Invalid selection, please choose again."
    fi
done

# Output the collected values
echo "Customer Input 1: $archetype_"
echo "Customer Input 2: $groupID_"
echo "ArtifactID: $artifactID_"
echo "Selected Option: $selected_option"

if [ "$selected_option" == "maven-archetype-quickstart" ]; then 
	mvn archetype:$archetype_ -DgroupId=$groupID_ -DartifactId=$artifactID_ -DarchetypeArtifactId=$selected_option -DinteractiveMode=false
else 
	mkdir $groupID_ && cd $groupID_
	mvn -B archetype:$archetype_ -DgroupId=$groupID_ -DartifactId=$artifactID_ -DarchetypeArtifactId=$selected_option
fi


