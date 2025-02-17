#!/bin/bash

createSpringProject(){
	archetype_=$1
	groupID_=$2
	artifactID_=$3
	selected_option=$4
	spring_version=$5
	echo "$spring_version"
	echo "mvn archetype:$archetype_ -DgroupId=$groupID_ -DartifactId=$artifactID_ -DarchetypeArtifactId=$selected_option -DinteractiveMode=false"
	echo "cd $artifactID_ || exit"
	echo "
	<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>${spring_version}</version>
        <relativePath/> 
    </parent>

    <groupId>com.example</groupId>
    <artifactId>myapp</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <!-- Maven Compiler Plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                </configuration>
            </plugin>

            <!-- Maven JAR Plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.2.0</version>
                <configuration>
                    <archive>
                        <manifest>
                            <mainClass>com.example.App</mainClass>
                        </manifest>
                    </archive>
                </configuration>
            </plugin>

            <!-- Spring Boot Repackage -->
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                        <configuration>
                            <classifier>springboot</classifier>
                            <mainClass>com.example.App</mainClass>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>

</project>
	"
}



echo "Archetype:(eg. generate,generate-spring)"
listed_archetypes=("generate" "generate-spring")
select selected_archetypes in "${listed_archetypes[@]}";do
	if [[ -n "$selected_archetypes" ]];then
		break
	else
		echo "Invalid Selection,please choose again. "
	fi
done

echo $selected_archetypes
archetype_=$selected_archetypes
echo $archetype_

# Prompt user for first string variable
#read -p "Archetype:(eg. generate ) " archetype_

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


createSpringProject $archetype_ $groupID_ $artifactID_ $selected_option 3.2.2

exit 0



if [ "$selected_option" == "maven-archetype-quickstart" ] && [ "$archetype_" == "generate" ]; then 
	echo "mvn archetype:$archetype_ -DgroupId=$groupID_ -DartifactId=$artifactID_ -DarchetypeArtifactId=$selected_option -DinteractiveMode=false"
elif [ "$selected_option" == "maven-archetype-simple" ]; then 
	mkdir $groupID_ && cd $groupID_
	mvn -B archetype:$archetype_ -DgroupId=$groupID_ -DartifactId=$artifactID_ -DarchetypeArtifactId=$selected_option
elif [ "$selected_option" == "maven-archetype-quickstart" ] && [ "$archetype" == "generate-spring" ]; then
	echo "Option 3"
else 
	echo "Invalid Option"
fi


