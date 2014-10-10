# this file is mainProg.rb

		# these lines print the versions and demonstrate that things are working so far
		#   they can be omitted
puts "JRUBY V #{JRUBY_VERSION}"
puts " RUBY V #{RUBY_VERSION}"


class JRonA

#======================

	def startJRonA
	
		require 'basicDemo.rb'
#		require 'cameraDemo.rb'
#		require 'scriptProg.rb'
		startDemo # this method is in the required file
	
	end # startJRonA

#======================
end # class JRonA
