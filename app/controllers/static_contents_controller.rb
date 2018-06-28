class StaticContentsController < ApplicationController

full_sanitizer = Rails::Html::FullSanitizer.new

def help

@data = StaticContent.find(1)
end

def privacypolicy
       
@data =  StaticContent.find(2)
end

def termsconditions

@data =  StaticContent.find(3)
end
   

	
end
