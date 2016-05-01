class MonthsController < ApplicationController
    
    
    def index
     
     @articles = Article.all
     @months = Month.all
     @hash = {}
     @months.each {|month| @hash[month.name] = 0 }
         @months.each do |month| 
             @articles.each do |article| 
                    if article.created_at.month == month.number.to_i && @hash[month.name] == 0
                    
                     @hash[month.name] = 1
                    elsif article.created_at.month == month.number.to_i && @hash[month.name] > 0   
                    
                     @hash[month.name] += 1
                
                    
                    end
            end
        end
        @hash
    end
    
    def show
        @articles = Article.all
        @months = Month.all
        @month = Month.find(params[:id])
        @articles = @articles.select {|article| article.created_at.month == @month.number.to_i }
    
    end    


end
