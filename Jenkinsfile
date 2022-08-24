pipeline {
  agent {
            
    docker { 
        
        image '796126936196.dkr.ecr.us-east-1.amazonaws.com/frodriguezh:latest' 
        args '-u root' 
    }
    
  }
  //Se fija timeout (buena practica)
  options {
      timeout(time: 5, unit: 'MINUTES') 
  }
  stages {
    //Limpiar espacion de trabajo (buena practica)
    stage('Clear Workspace') {
        steps {
            cleanWs()
        }
    }
    stage('Check Request') {
        steps {
            echo "Validar merge request"
            echo "Validar isses"
        }
    }
    stage('Clone Sources') {
        steps {
            //git url: "https://gitlab.com/frernandoa.rodriguezh/netcore.git", branch: "main", credentialsId: 'uGitlab'
            echo "Clonar proyecto"
            echo "SAST-Sonarqube+++"
        }  
    }
    stage('Build Artifact') {
        steps {
            echo "SCA-csproject+++"
            echo "Compilar y mover artefacto"
            //sh "dotnet restore"
            //sh "dotnet publish -c release -o /app --no-restore"
            //sh "cp -R /app ${WORKSPACE}/app_$BUILD_NUMBER"
        }  
    }
    stage('Package Artifact') {
        steps {
            echo "Generar zip ${WORKSPACE}/app_$BUILD_NUMBER"
        }
    }
    stage('Upload Artifact') {
        steps {
            echo "Validar repositorio (si no existe, se crea)"
            echo "Subir zip a Jfrog"
            echo "tageo o firma+++"
            echo "promocion de artefacto+++"
        }
    }
    stage('Download Artifact') {
        steps {
            echo "Descargar zip desde Jfrog"
        }
    }
    stage('Desplegar Artifact') {
        steps {
            echo "Obtener secreto de ssh"
            echo "Conectarse a la instancia"
            echo "Backup del app"
            echo "Copiar zip"
            echo "IIS stop"
            echo "Descomprimir zip"
            echo "IIS start"
        }
    }
    
  }

}
