# Paweł Wilkosz
module Interpolacje
    using PyPlot

    function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
        len = length(f)

        fx = copy(f)

        for i in 2:len
            for j = len:-1:i
                fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
            end
        end

        return fx
    end

    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        len = length(x)
        nt = fx[len]

        for i in len - 1:-1:1
            nt = fx[i] + (t - x[i]) * nt
        end

        return nt
    end

    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        len = length(x)
        a = zeros(len)
        a[len] = fx[len]

        for i in len - 1:-1:1
            a[i] = fx[i] - a[i + 1] * x[i]

            for j in i + 1:len - 1
                a[j] = a[j] - a[j + 1] * x[i]
            end
        end

        return a
    end

    function rysujNnfx(f, a::Float64, b::Float64, n::Int, plotName="nnfx")
        max_nodes = n + 1
        x = zeros(max_nodes)
        y = zeros(max_nodes)
        f_x = zeros(max_nodes)


        h = (b - a) / n
        kh = Float64(0.0)

        mult = 20

        plot_args = zeros(mult * max_nodes)
        plot_val = zeros(mult * max_nodes)
        plot_ip = zeros(mult * max_nodes)

        for i in 1:max_nodes
            x[i] = a + kh
            y[i] = f(x[i])
            kh += h
        end

        f_x = ilorazyRoznicowe(x, y)

        kh = Float64(0.0)
        max_nodes *= mult
        h = (b - a) / (max_nodes - 1)

        for i in 1:max_nodes
            plot_args[i] = a + kh
            plot_ip[i] = warNewton(x, f_x, plot_args[i])
            plot_val[i] = f(plot_args[i])
            kh += h
        end

        clf()
        plot(plot_args, plot_val, label = "f(x)", linewidth = 2.5)
        plot(plot_args, plot_ip, label = "w(x)", linewidth = 1.5)
        grid(true)
        legend(loc = 2, borderaxespad = 0)
        savefig("plots/$(plotName).png")
    end

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
end