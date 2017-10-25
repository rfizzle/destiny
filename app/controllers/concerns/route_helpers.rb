# frozen_string_literal: true

module RouteHelpers
  # Execute a trailblazer operation
  #
  # @param operation_class [Trailblazer::Operation]
  def operation(operation_class)
    res = run operation_class

    respond_to do |format|
      res.success? ? op_success(format, res) : op_fail(format, res)
    end
  end

  # Set JSON success status hash
  #
  # @param data [Object] the success object to add to the response
  # @return [Hash] the response hash
  def json_success(data, extra = nil)
    res = { status: 'success', data: data }
    return res unless extra
    res.merge(extra: extra)
  end

  # Set JSON failure status hash
  #
  # @param message [String] the failure message to add to the response
  # @return [Hash] the response hash
  def json_fail(message)
    { status: 'fail', data: { message: message } }
  end

  # Set JSON error status hash
  #
  # @param message [String] the error message to add to the response
  # @return [Hash] the response hash
  def json_error(message = 'An error occurred')
    { status: 'error', message: message }
  end

  # Build a flash message with a success type
  #
  # @param message [String] message text
  # @return [Hash] an object containing the type and message
  def success_notice(message)
    { type: 'success', message: message }
  end

  # Build a flash message with a failure type
  #
  # @param message [String] message text
  # @return [Hash] an object containing the type and message
  def failure_notice(message)
    { type: 'error', message: message }
  end

  private

  # Return correct formatted response
  #
  # @param format [ActionController::MimeResponds::Collector] response format
  # @param result [Trailblazer::Operation::Result] operation result
  # @return [ActionController::Redirecting,String] redirect or JSON response
  def op_success(format, result)
    format.html { render_or_redirect(result) }
    format.json { render json: json_success(representer_map(result), result['extra']) }
  end

  # Render or redirect for HTML
  #
  # @param result [Trailblazer::Operation::Result] operation result
  # @return [ActionController::Redirecting, ActionController::Rendering]
  def render_or_redirect(result)
    result['redirect'] ? redirect_to(result['redirect'], notice: success_notice(result['message'])) : render
  end

  # Return correct formatted response for operation failures
  #
  # @param format [ActionController::MimeResponds::Collector] response format
  # @param result [Trailblazer::Operation::Result] operation result
  # @return [ActionController::Redirecting,String] redirect or JSON response
  def op_fail(format, result)
    p = root_path
    msg = OperationFailure.new(result).to_s
    format.html { redirect_back fallback_location: p, notice: failure_notice(msg) }
    format.json { render json: json_fail(msg), status: :unprocessable_entity }
  end

  # Determines if a result model is iterable or a single object
  #
  # @param result [Trailblazer::Operation::Result] operation result
  # @return [Object, Array<Object>] returns either a single represented object or an array of represented objects
  def representer_map(result)
    return result['response'] || {} unless result['representer']
    if result['model'].respond_to? :each
      result['model'].map { |x| result['representer'].new(x) }
    else
      result['representer'].new(result['model'])
    end
  end
end
