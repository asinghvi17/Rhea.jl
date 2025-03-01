mutable struct variable{T}
    p::T
end

Base.show(io::IO, var::variable{T}) where {T<:Number} = print(io, "var($(var.p))")
Base.show(io::IO, var::variable{Nothing}) = print(io, "NIL")

nil_var() = variable(nothing)

variable() = variable(0.0)
variable(val::Real) = variable{Float64}(val)
variable(v::variable) = v

value(v::variable) = v.p
int_value(v::variable)::Int = round(v.p)
function set_value(v::variable, p)
    v.p = p
end

is_nil(v::variable) = isnothing(v.p)

is(v::variable, v2::variable) = v === v2
