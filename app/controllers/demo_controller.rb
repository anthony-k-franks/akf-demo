class DemoController < ApplicationController
    def test
        @test_var = 'This is a Test.'
        return @test_var
    end
end
