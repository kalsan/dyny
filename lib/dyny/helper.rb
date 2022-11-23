module Dyny
  # This module is injected into every code that runs in Dyny.
  module Helper
    # Intial HTML Tag set was extracted from https://github.dev/activeadmin/arbre
    # The tags `label` and `select` were removed because they collide with Rails helpers and are rarely used in practice. Use `concat tag.label` instead.
    HTML_TAGS = %i[a
                   abbr
                   address
                   area
                   article
                   aside
                   audio
                   b
                   base
                   bdo
                   blockquote
                   body
                   br
                   button
                   canvas
                   caption
                   cite
                   code
                   col
                   colgroup
                   command
                   datalist
                   dd
                   del
                   details
                   dfn
                   div
                   dl
                   dt
                   em
                   embed
                   fieldset
                   figcaption
                   figure
                   footer
                   form
                   h1 h2 h3 h4 h5 h6
                   head
                   header
                   hgroup
                   hr
                   html
                   i
                   iframe
                   img
                   input
                   ins
                   keygen
                   kbd
                   legend
                   li
                   link
                   main
                   map
                   mark
                   menu
                   menuitem
                   meta
                   meter
                   nav
                   noscript
                   object
                   ol
                   optgroup
                   option
                   output
                   param
                   pre
                   progress
                   q
                   s
                   samp
                   script
                   section
                   small
                   source
                   span
                   strong
                   style
                   sub
                   summary
                   sup
                   svg
                   table
                   tbody
                   td
                   textarea
                   tfoot
                   th
                   thead
                   time
                   title
                   tr
                   track
                   ul
                   var
                   video
                   wbr].freeze

    # Uncomment the following lines to search for method name collisions.
    # HTML_TAGS.each do |tag|
    #   begin
    #     send tag.to_sym
    #     puts "Clash! #{tag.inspect}"
    #   rescue ArgumentError
    #     puts "Clash! #{tag.inspect}"
    #   rescue NoMethodError
    #   end
    # end

    HTML_TAGS.each do |tag|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{tag}(...)           # def form(...)
        concat tag.#{tag}(...)  #   concat tag.form(...)
      end                       # end
      RUBY
    end

    # method name :p is already taken for printing purposes, therefore we make `para` generate <p> tags.
    def para(...)
      concat tag.p(...)
    end
  end
end
