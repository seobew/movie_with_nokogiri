module ModalHelper
	def modal(css_id, header_text, hidden = true, &block)
		content_tag(:div, :class => 'modal', :id => css_id, :style => ("display:none;" if hidden) ) do
			concat modal_header(header_text)
			concat modal_body(&block)
		end
	end

	def modal_button(link_text, href)
		modal_caller link_text, href, :button
	end

	def modal_link(link_text, href)
		modal_caller link_text, href
	end

	private

	def modal_caller(link_text, href, type = nil)
		options = { :"data-toggle" => "modal" }
		options.merge!({ :class => "btn" }) if type == :button
		link_to link_text, "#" + href, options
	end

	def modal_header(header_text)
		content_tag(:div, :class => 'modal-header') do
			concat content_tag(:button, 'x', :class => 'close', :"data-dismiss" => 'modal')
			concat content_tag(:h3, header_text)
		end
	end

	def modal_body
		content_tag(:div, :class => 'modal-body') do
			yield
		end
	end
end
