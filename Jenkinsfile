pipeline {
	agent any

	stages {
		stage('Build Backend') {
			steps {
				sh 'cd backend && bundle exec install'
			}
		}
		stage('Test') {
			steps {
				sh 'cd backend && bundle exec rspec'
			}
		}
	}
}