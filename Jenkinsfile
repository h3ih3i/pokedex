pipeline {
	agent any

	stages {
		stage('Build Backend') {
			steps {
				sh 'cd backend && bundle install'
			}
		}

		stage('migrations') {
			steps {
				sh 'cd backend && bundle exec rake db:migrate'
			}
		}
		stage('Test') {
			steps {
				sh 'cd backend && bundle exec rspec'
			}
		}
	}
}