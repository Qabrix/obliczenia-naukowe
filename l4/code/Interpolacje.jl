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
        nodes = n + 1
        x = zeros(nodes)
        y = zeros(nodes)
        f_x = zeros(nodes)


        h = (b - a) / n
        arg = a

        mult = 20

        plot_x = zeros(mult * nodes)
        plot_f = zeros(mult * nodes)
        plot_w = zeros(mult * nodes)

        for i in 1:nodes
            x[i] = arg
            y[i] = f(arg)
            arg += h
        end

        f_x = ilorazyRoznicowe(x, y)

        arg = a
        nodes *= mult
        h = (b - a) / (nodes - 1)

        for i in 1:nodes
            plot_x[i] = arg
            plot_w[i] = warNewton(x, f_x, arg)
            plot_f[i] = f(arg)
            arg += h
        end

        clf()
        plot(plot_x, plot_f, label = "f(x)", linewidth = 2.5)
        plot(plot_x, plot_w, label = "w(x)", linewidth = 1.5)
        grid(true)
        legend(loc = 2, borderaxespad = 0)
        savefig("plots/$(plotName).png")
    end

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx
end