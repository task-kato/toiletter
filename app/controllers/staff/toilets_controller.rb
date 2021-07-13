class Staff::ToiletsController < Staff::Base

    def index
        @toilet = Toilet.first
        gon.toilet = @toilet
    end
end
