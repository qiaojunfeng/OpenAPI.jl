# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


function deleteOrder_read(handler)
    function deleteOrder_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        path_params = HTTP.getparams(req)
        openapi_params["orderId"] = OpenAPI.Servers.to_param(String, path_params, "orderId", required=true, )
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function deleteOrder_validate(handler)
    function deleteOrder_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        return handler(req)
    end
end

function deleteOrder_invoke(impl; post_invoke=nothing)
    function deleteOrder_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = try
            impl.deleteOrder(req::HTTP.Request, openapi_params["orderId"];)
        catch ex
            @error("Error in deleteOrder", exception=(ex, catch_backtrace()))
            HTTP.Response(500, "Internal Server Error")
        end
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end

function getInventory_read(handler)
    function getInventory_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function getInventory_validate(handler)
    function getInventory_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        return handler(req)
    end
end

function getInventory_invoke(impl; post_invoke=nothing)
    function getInventory_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = try
            impl.getInventory(req::HTTP.Request;)
        catch ex
            @error("Error in getInventory", exception=(ex, catch_backtrace()))
            HTTP.Response(500, "Internal Server Error")
        end
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end

function getOrderById_read(handler)
    function getOrderById_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        path_params = HTTP.getparams(req)
        openapi_params["orderId"] = OpenAPI.Servers.to_param(Int64, path_params, "orderId", required=true, )
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function getOrderById_validate(handler)
    function getOrderById_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        OpenAPI.validate_param("orderId", "getOrderById", :maximum, openapi_params["orderId"], 5, false)
        OpenAPI.validate_param("orderId", "getOrderById", :minimum, openapi_params["orderId"], 1, false)
        
        return handler(req)
    end
end

function getOrderById_invoke(impl; post_invoke=nothing)
    function getOrderById_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = try
            impl.getOrderById(req::HTTP.Request, openapi_params["orderId"];)
        catch ex
            @error("Error in getOrderById", exception=(ex, catch_backtrace()))
            HTTP.Response(500, "Internal Server Error")
        end
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end

function placeOrder_read(handler)
    function placeOrder_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        openapi_params["Order"] = OpenAPI.Servers.to_param_type(Order, String(req.body))
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function placeOrder_validate(handler)
    function placeOrder_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        return handler(req)
    end
end

function placeOrder_invoke(impl; post_invoke=nothing)
    function placeOrder_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = try
            impl.placeOrder(req::HTTP.Request, openapi_params["Order"];)
        catch ex
            @error("Error in placeOrder", exception=(ex, catch_backtrace()))
            HTTP.Response(500, "Internal Server Error")
        end
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end


function registerStoreApi(router::HTTP.Router, impl; path_prefix::String="", optional_middlewares...)
    HTTP.register!(router, "DELETE", path_prefix * "/store/order/{orderId}", OpenAPI.Servers.middleware(impl, deleteOrder_read, deleteOrder_validate, deleteOrder_invoke; optional_middlewares...))
    HTTP.register!(router, "GET", path_prefix * "/store/inventory", OpenAPI.Servers.middleware(impl, getInventory_read, getInventory_validate, getInventory_invoke; optional_middlewares...))
    HTTP.register!(router, "GET", path_prefix * "/store/order/{orderId}", OpenAPI.Servers.middleware(impl, getOrderById_read, getOrderById_validate, getOrderById_invoke; optional_middlewares...))
    HTTP.register!(router, "POST", path_prefix * "/store/order", OpenAPI.Servers.middleware(impl, placeOrder_read, placeOrder_validate, placeOrder_invoke; optional_middlewares...))
    return router
end
