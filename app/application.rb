class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/item/)
            search_item = req.path.split("/items/").last
            if search_item = @@items.detect{|item|item.name == search_item}
               resp.write "#{search_item.price}"
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end
