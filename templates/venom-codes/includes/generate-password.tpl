{* VENOM CODES — Password Generator Component *}

<form action="#" id="frmGeneratePassword">
    <div class="modal fade" id="modalGeneratePassword">
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content" style="border-radius: 1rem; border: none; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);">
                <div class="modal-header" style="background: linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%); color: white; border-radius: 1rem 1rem 0 0; padding: 1.5rem; border-bottom: none;">
                    <h4 class="modal-title" style="font-weight: 600; font-size: 1.25rem; margin: 0;">
                        {lang key='generatePassword.title'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white; opacity: 0.8; font-size: 1.5rem; font-weight: 300; line-height: 1; text-shadow: none;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="padding: 1.5rem;">
                    <div class="alert alert-danger w-hidden" id="generatePwLengthError" style="border-radius: 0.5rem; padding: 0.75rem 1rem; margin-bottom: 1rem; background: #fef2f2; border: 1px solid #fecaca; color: #991b1b;">
                        {lang key='generatePassword.lengthValidationError'}
                    </div>
                    <div class="form-group row" style="margin-bottom: 1.25rem;">
                        <label for="generatePwLength" class="col-sm-4 col-form-label" style="font-weight: 500; color: var(--gray-700, #374151); padding-top: 0.5rem;">{lang key='generatePassword.pwLength'}</label>
                        <div class="col-sm-8">
                            <input type="number" 
                                   min="8" 
                                   max="64" 
                                   value="12" 
                                   step="1" 
                                   class="form-control input-inline input-inline-100" 
                                   id="inputGeneratePasswordLength"
                                   style="height: 2.75rem; border-radius: 0.5rem; border: 1px solid var(--gray-300, #d1d5db); width: 100px; font-size: 1rem;">
                        </div>
                    </div>
                    <div class="form-group row" style="margin-bottom: 1.25rem;">
                        <label for="generatePwOutput" class="col-sm-4 col-form-label" style="font-weight: 500; color: var(--gray-700, #374151); padding-top: 0.5rem;">{lang key='generatePassword.generatedPw'}</label>
                        <div class="col-sm-8">
                            <input type="text" 
                                   class="form-control" 
                                   id="inputGeneratePasswordOutput"
                                   readonly
                                   style="height: 2.75rem; border-radius: 0.5rem; border: 1px solid var(--gray-300, #d1d5db); background: var(--gray-50, #f9fafb); font-family: 'Courier New', monospace; font-size: 0.875rem;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8 offset-sm-4">
                            <button type="submit" class="btn btn-default btn-sm" style="border-radius: 0.5rem; padding: 0.5rem 1rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-700, #374151); font-weight: 500; margin-right: 0.5rem; transition: all 0.2s;">
                                <i class="fas fa-plus fa-fw"></i>
                                {lang key='generatePassword.generateNew'}
                            </button>
                            <button type="button" class="btn btn-default btn-sm copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput" style="border-radius: 0.5rem; padding: 0.5rem 1rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-700, #374151); font-weight: 500; transition: all 0.2s;">
                                <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15" style="vertical-align: text-bottom;">
                                {lang key='copy'}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="border-top: 1px solid var(--gray-200, #e5e7eb); padding: 1rem 1.5rem; background: var(--gray-50, #f9fafb); border-radius: 0 0 1rem 1rem;">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; border: 1px solid var(--gray-300, #d1d5db); background: white; color: var(--gray-700, #374151); font-weight: 500;">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary" id="btnGeneratePasswordInsert" data-clipboard-target="#inputGeneratePasswordOutput" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; background: linear-gradient(135deg, var(--primary-600, #2563eb) 0%, var(--primary-700, #1d4ed8) 100%); border: none; color: white; font-weight: 500;">
                        {lang key='generatePassword.copyAndInsert'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
