#		Copyright 2013 Robin McKay

#		Licensed under the EUPL, Version 1.1 only (the "Licence");
#		You may not use this work except in compliance with the Licence.
#		You may obtain a copy of the Licence at:

#			http://joinup.ec.europa.eu/software/page/eupl

#		Unless required by applicable law or agreed to in writing, software 
#		distributed under the Licence is distributed on an "AS IS" basis,
#		WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

#		See the Licence for the specific language governing permissions and 
#		limitations under the Licence.

#===============================
#		This licence is similar to the GNU General Public License v.2,  the
#			Eclipse Public License v. 1.0 etc.
#===============================

# this file is JRonA.rb
# 			~24 lines of code
#===============================


		# this is a standard class to keep life simple
class JRonA

	def initialize(act)
	
		@activity = act # captures the reference to the Android Activity for future use
	
	end # initialize
	
#===================

			# this is a helper method to simplify updating the screen on the UI thread
	def jronaSetContentView(vvv)
		
			@activity.runOnUiThread do
				@activity.setContentView(vvv)
			end
			
	end # jronaSetContentView
	
##							For Info:  Following is an alternative to runOnUiThread

#					h = Handler.new(Looper.getMainLooper())
#					h.post do # this is the same as @activity.runOnUiThread do
#						@activity.setContentView(vvv)
#					end

##							Explanation:
##							----Looper.getMainLooper() creates the Handler in the UI Thread 	
##							----Handler has some additional methods that may be useful
##							----runOnUiThread actually uses Handler		
			
			
end # class JRonA

#======================

	def setupLoadPath(act)
	
		apkdir = act.getApplicationInfo().sourceDir
		apkdir = apkdir.gsub("/pkg", "")

		pathA = "file:" + apkdir + "!/jruby.home/lib/ruby/site_ruby"
		pathB = "file:" + apkdir + "!/jruby.home/lib/ruby/shared"
		pathC = "file:" + apkdir + "!/jruby.home/lib/ruby/1.9"

		$LOAD_PATH << pathA << pathB << pathC
		
	
	end # setupLoadPath

#======================

	act = $activityThis	# picks up the value from JRonA.java
			
	setupLoadPath(act)
	
	require 'mainProg.rb'

	jrona = JRonA.new(act)
	jrona.startJRonA # which is in mainProg

	jrona # pass a reference to the instance back to the Java code for future use

#======================
