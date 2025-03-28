<div id="oxSuccess" class="alert alert-success w-hidden">
    <i class="fas fa-check fa-fw"></i>
    <span></span>
</div>
<div id="oxLoadError" class="alert alert-danger w-hidden">
    <i class="fas fa-times fa-fw"></i>
    <span></span>
</div>

<div class="card mb-4">
    <div class="card-body">
        <h3 class="card-title">{lang key='store.ox.manage'}</h3>
        <p>{lang key='ox.intro'}</p>
        <p>{lang key='ox.alias.intro'}</p>

        <div class="btn-toolbar justify-content-between mb-1" role="toolbar">
            <div class="btn-group" role="group">
                <form action="{$upgradeUrl}" method="post">
                    <input type="hidden" name="isproduct" value="{$isService}">
                    <input type="hidden" name="serviceid" value="{$model->id}">
                    <button type="submit" class="btn btn-secondary btn-sm">
                        <i class="fal fa-arrow-circle-up fa-fw"></i>
                        {lang key='upgrade'}
                    </button>
                </form>
            </div>
            <div class="btn-group btn-group-sm" role="group">
                <button id="btnAddAccount" type="button" class="btn btn-primary btn-sm">
                    <i class="fal fa-plus"></i>
                    {lang key='ox.createUser'}
                </button>
                <button id="btnRefresh" type="button" class="btn btn-sm btn-default disabled" disabled="disabled">
                    <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                    {lang key='ox.refresh'}
                </button>
            </div>
        </div>

        <div id="accountCount">{lang key='ox.accountCount' number='-' limit=$model->qty}</div>
        <table class="tableAccounts table" style="display: table">
            <thead>
            <tr>
                <th>{lang key='ox.emailAddress'}</th>
                <th class="w-25">{lang key='ox.mailboxSize'}</th>
                <th class="w-50 invisible"></th>
            </tr>
            </thead>
            <tbody>
            <tr class="loading">
                <td class="text-center" colspan="4">
                    <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                    {lang key='loading'}
                </td>
            </tr>
            <tr class="no-accounts w-hidden">
                <td class="text-center" colspan="4">{lang key='ox.noAccounts'}</td>
            </tr>
            </tbody>
            <tbody class="cloneAccountsBody w-hidden"
                   data-account-id=""
                   data-account=""
                   data-first-name=""
                   data-last-name=""
                   data-display-name=""
            >
            <tr>
                <td>
                    <span class="account"></span>@{$domain}<br/>
                    <i class="fas fa-chevron-right fa-xs"></i>
                    <span class="email-aliases">
                        {lang key='ox.alias.emailAliases'}: <span class="alias-count"></span>
                    </span>
                </td>
                <td><span class="limit"></span>GB</td>
                <td class="text-right">
                    <div class="d-inline d-md-none">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle dropdown-hamburger" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bars"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#" class="dropdown-item manage-account">{lang key='ox.manageAccount'}</a></li>
                                <li><a href="#" class="dropdown-item set-ox-password">{lang key='ox.setPassword'}</a></li>
                                <li><a href="#" class="dropdown-item list-group-item-action list-group-item-danger ox-delete">{lang key='ox.delete'}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="d-none d-md-inline d-xl-none">
                        <div class="btn-group" role="group">
                            <button class="btn btn-default btn-sm manage-account">{lang key='ox.manageAccount'}</button>
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <ul class="dropdown-menu">
                                <li><a href="#" class="dropdown-item set-ox-password">{lang key='ox.setPassword'}</a></li>
                                <li><a href="#" class="dropdown-item list-group-item-action list-group-item-danger ox-delete">{lang key='ox.delete'}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="d-none d-xl-inline">
                        <div class="btn-group" role="group">
                            <button class="btn btn-default btn-sm manage-account">{lang key='ox.manageAccount'}</button>
                            <button class="btn btn-default btn-sm set-ox-password">{lang key='ox.setPassword'}</button>
                            <button class="btn btn-danger btn-sm ox-delete">{lang key='ox.delete'}</button>
                        </div>
                    </div>
                </td>
            </tr>
            </tbody>
            <tbody class="cloneAliasesBody w-hidden" data-account-id="">
            <tr>
               <td colspan="3">
                   <table class="table">
                       <tr class="create-alias" data-alias="">
                           <td colspan="2">
                               <input type="text" name="alias">&nbsp;@{$domain}
                           </td>
                           <td class="text-right">
                               <div class="btn-group" role="group">
                                   <button class="btn btn-primary btn-xs ox-create-alias">
                                       <span class="loader w-hidden">
                                           <i class="far fa-sync-alt fa-spin" aria-hidden="true"></i>
                                       </span>
                                       <span class="create-string">
                                           {lang key='ox.alias.createButton'}
                                       </span>
                                   </button>
                               </div>
                           </td>
                       </tr>
                   </table>
               </td>
            </tr>
            </tbody>
            <tr class="cloneAliasRow w-hidden"
                data-alias=""
            >
                <td colspan="2"><span class="alias"></span>@{$domain}</td>
                <td class="text-right">
                    <div class="btn-group" role="group">
                        <button class="btn btn-default btn-xs ox-delete-alias">{lang key='ox.delete'}</button>
                    </div>
                </td>
            </tr>
        </table>

    </div>
</div>

<ul class="nav nav-tabs responsive-tabs-sm">
    <li class="nav-item">
        <a href="#retrievalsettings" class="nav-link active" data-toggle="tab">
            <i class="far fa-envelope fa-fw"></i>
            {lang key='ox.settings.retrieval'}
        </a>
    </li>
    <li class="nav-item">
        <a href="#davsettings" class="nav-link"  data-toggle="tab">
            <i class="far fa-calendar-alt fa-fw"></i>
            {lang key='ox.settings.davSettings'}
        </a>
    </li>
    <li class="nav-item">
        <a href="#usage" class="nav-link"  data-toggle="tab">
            <i class="far fa-file-alt fa-fw"></i>
            {lang key='ox.settings.usageInstructions'}
        </a>
    </li>
    <li class="nav-item w-hidden" id="migrationNav">
        <a href="#migration" class="nav-link"  data-toggle="tab">
            <i class="far fa-file-alt fa-fw"></i>
            {lang key='ox.settings.migrationTitle'}
        </a>
    </li>
</ul>
<div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
<div class="tab-content product-details-tab-container w-text-09 mb-4">
    <div class="tab-pane fade show active" id="retrievalsettings">
        <p>{lang key='ox.settings.retrievalIntro'}</p>
        <table class="table">
            <tbody>
                <tr>
                    <td>{lang key='ox.settings.username'}</td>
                    <td>{lang key='ox.settings.email' domain=$domain}</td>
                </tr>
                <tr>
                    <td>{lang key='clientareapassword'}</td>
                    <td>{lang key='ox.settings.password'}</td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.pop'}</td>
                    <td>
                        <span class="pop-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="pop-port"></span>
                    </td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.incoming'}</td>
                    <td>
                        <span class="incoming-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="incoming-port"></span>
                    </td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.outgoing'}</td>
                    <td>
                        <span class="outgoing-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="outgoing-port"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade" id="davsettings">
        <p>{lang key='ox.settings.davSettingsIntro'}</p>
        <table class="table">
            <tbody>
                <tr>
                    <td>{lang key='ox.settings.username'}</td>
                    <td>{lang key='ox.settings.email' domain=$domain}</td>
                </tr>
                <tr>
                    <td>{lang key='clientareapassword'}</td>
                    <td>{lang key='ox.settings.caldavPassword'}</td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.serverUrl'}</td>
                    <td>
                        <span class="calendar-server">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade" id="usage">
        <table class="table">
            <thead id="tablePanelUsageHead">
                <tr class="loading">
                    <td>
                        <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                        {lang key='loading'}
                    </td>
                </tr>
            </thead>
            <tbody id="tablePanelUsage">
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade w-hidden" id="migration">
        <p>{lang key="ox.settings.migrationIntro"}</p>
        <div>
            <a class="migration-url btn btn-info btn-block btn-lg" href="#" target="_blank"
                >{lang key="ox.settings.migrationLaunch"}</a>
        </div>
    </div>
</div>

<form id="frmOxAddAccount" action="{$addAccountUrl}" method="post">
    <div class="modal fade" id="modalAddAccount">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalAddAccountTitle">
                        {lang key='ox.createUser'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden">
                        <i class="fas fa-times fa-fw"></i>
                        <span></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputFirstName">{lang key='orderForm.firstName'}</label>
                                <input id="inputFirstName" type="text" autocomplete="off" class="form-control required" name="first">
                                <span class="field-error-msg">{lang key='ox.required.firstName'}</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputLastName">{lang key='orderForm.lastName'}</label>
                                <input id="inputLastName" type="text" autocomplete="off" class="form-control required" name="last">
                                <span class="field-error-msg">{lang key='ox.required.lastName'}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputDisplayName">{lang key='ox.displayName'}</label>
                                <input id="inputDisplayName" type="text" autocomplete="off" class="form-control required" name="display">
                                <span class="field-error-msg">{lang key='ox.required.displayName'}</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputEmailAddress">{lang key='orderForm.emailAddress'}</label>
                                <div class="input-group">
                                    <input id="inputEmailAddress" type="text" autocomplete="off" class="form-control required" name="email">
                                    <div class="input-group-append"><span class="input-group-text">@{$domain}</span></div>
                                </div>
                                <span class="field-error-msg">{lang key='ox.required.email'}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputPassword">{lang key='clientareapassword'}</label>
                                <div class="input-group">
                                    <input type="password" class="form-control required" name="password" id="inputPassword" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-default generate-password" data-targetfields="inputPassword,inputConfirmPassword">
                                            {lang key="generatePassword.btnShort"}
                                        </button>
                                    </div>
                                </div>
                                <span class="field-error-msg">{lang key='ox.required.password'}</span>
                                <div class="password-strength-meter">
                                    <div class="progress" style="height: 10px; margin-top: 10px">
                                        <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                        </div>
                                    </div>
                                    <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key="pwstrength"}: {lang key="pwstrengthenter"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputConfirmPassword">{lang key='clientareaconfirmpassword'}</label>
                                <input id="inputConfirmPassword" type="password" autocomplete="off" class="form-control required match" data-match-field="inputPassword" name="password2">
                                <span class="field-error-msg">{lang key='ox.required.passwordMatch'}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='orderForm.add'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxManageAccount" action="{$manageAccountUrl}" method="post">
    <div class="modal fade" id="modalManageAccount">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalManageAccountTitle">
                        {lang key='ox.manageAccount'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden">
                        <i class="fas fa-times fa-fw"></i>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="inputManageDisplayName">{lang key='ox.displayName'}</label>
                        <input id="inputManageDisplayName" type="text" autocomplete="off" class="form-control required" name="display">
                        <span class="field-error-msg">{lang key='ox.required.displayName'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputManageFirstName">{lang key='orderForm.firstName'}</label>
                        <input id="inputManageFirstName" type="text" autocomplete="off" class="form-control required" name="first">
                        <span class="field-error-msg">{lang key='ox.required.firstName'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputManageLastName">{lang key='orderForm.lastName'}</label>
                        <input id="inputManageLastName" type="text" autocomplete="off" class="form-control required" name="last">
                        <span class="field-error-msg">{lang key='ox.required.lastName'}</span>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='clientareasavechanges'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxSetPassword" action="{$setPasswordUrl}" method="post">
    <div class="modal fade" id="modalSetPassword">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalSetPasswordTitle">
                        {lang key='ox.setPasswordFor'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden">
                        <i class="fas fa-times fa-fw"></i>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="inputChangePassword">{lang key='clientareapassword'}</label>
                        <div class="input-group">
                            <input type="password" class="form-control required" name="password" id="inputChangePassword" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default generate-password" data-targetfields="inputChangePassword,inputChangePasswordConfirm">
                                    {lang key="generatePassword.btnShort"}
                                </button>
                            </div>
                        </div>

                        <div class="password-strength-meter">
                            <div class="progress" style="height: 10px; margin-top: 10px">
                                <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                </div>
                            </div>
                            <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key="pwstrength"}: {lang key="pwstrengthenter"}</p>
                        </div>
                        <span class="field-error-msg">{lang key='ox.required.password'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputChangePasswordConfirm">{lang key='clientareaconfirmpassword'}</label>
                        <input id="inputChangePasswordConfirm" type="password" autocomplete="off" class="form-control required match" data-match-field="inputChangePassword" name="password2">
                        <span class="field-error-msg">{lang key='ox.required.passwordMatch'}</span>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='ox.setPassword'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxDeleteAccount" action="{$deleteAccountUrl}" method="post">
    <div class="modal fade" id="modalDeleteAccount">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalDeleteAccountTitle">
                        {lang key='ox.deleteAccount'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalDeleteAccountBody">
                    <div class="alert alert-danger modal-error w-hidden">
                        <i class="fas fa-times fa-fw"></i>
                        <span></span>
                    </div>
                    <span class="delete-question" aria-hidden="true">{lang key='ox.deleteAccountQuestion'}</span>
                    <span class="delete-aliases-question" aria-hidden="true">{lang key='ox.deleteAccountWithAliasesQuestion'}</span>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-danger ox-submit-button" id="btnDoDelete">
                        {lang key='ox.delete'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxDeleteAlias" action="{$modifyAliasesUrl}" method="post">
    <div class="modal fade" id="modalDeleteAlias">
        <input type="hidden" value="" name="aliasAction">
        <input type="hidden" value="" name="account">
        <input type="hidden" value="" name="alias">
        <input type="hidden" value="" name="aliases">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalDeleteAccountTitle">
                        {lang key='ox.alias.deleteTitle' domain=$domain}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalDeleteAccountBody">
                    <div class="alert alert-danger modal-error w-hidden">
                        <i class="fas fa-times fa-fw"></i>
                        <span></span>
                    </div>
                    {lang key='ox.alias.deleteQuestion'}
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-danger ox-submit-button" id="btnDoDelete">
                        {lang key='ox.delete'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    function loadAccounts(force) {
        var trLoading = jQuery('tr.loading'),
            divError = jQuery('#oxLoadError'),
            trNoAccounts = jQuery('tr.no-accounts');

        force = force || 0;

        if (divError.is(':visible')) {
            divError.hide();
        }

        jQuery('#btnRefresh').addClass('disabled')
            .prop('disabled', 'disabled')
            .find('i')
            .addClass('fa-spin');

        clearAccounts();
        clearAliases();
        trNoAccounts.hide();
        if (trLoading.not(':visible')) {
            trLoading.show();
        }
        WHMCS.http.jqClient.jsonPost({
            url: '{$listAccountsUrl}',
            data: {
                token: csrfToken,
                force: force
            },
            success: function(data) {
                if (data.failedMessage) {
                    jQuery('#oxLoadError').text(data.failedMessage).show();
                } else {
                    if (typeof data.accounts.length === "undefined" || data.accounts.length === 0) {
                        trNoAccounts.show();
                    } else {
                        jQuery.each(data.accounts, function(index, account) {
                            addAccountToTable(account);
                            addAliasesToTable(account);
                            updateAliasesDisplay(account.id);
                        });
                    }
                }
            },
            always: function() {
                trLoading.hide();
                updateAccountsDisplay();
                jQuery('#btnRefresh').removeClass('disabled').prop('disabled', false)
                    .find('i').removeClass('fa-spin');
            }
        });
    }

    function addAccountToTable(data) {
        var table = jQuery('table.tableAccounts'),
            clone = jQuery('tbody.cloneAccountsBody').clone();

        clone.attr('id', '');
        clone.find('.account')
            .text(data.username);
        clone.find('.limit')
            .text(data.quota);
        clone.find('.manage-aliases')
            .attr('href', '{$manageAliasesUrl}&account=' + data.username);
        clone.attr('data-account-id', data.id)
            .attr('data-first-name', data.first_name)
            .attr('data-last-name', data.last_name)
            .attr('data-display-name', data.display_name)
            .attr('data-account', data.username + '@{$domain}');
        clone.addClass('account-entry').removeClass('cloneAccountsBody').show();
        table.append(clone);
    }

    function addAliasesToTable(data) {
        var table = jQuery('table.tableAccounts'),
            cloneTbody = jQuery('tbody.cloneAliasesBody').clone();

        if (typeof data.aliases !== 'undefined' && data.aliases.length > 0) {
            data.aliases.forEach(function(alias) {
                var isPrimary = false;
                if (data.username.localeCompare(alias, 'en', { sensitivity: 'base' }) === 0) {
                    isPrimary = true;
                }
                addAliasTr(alias, cloneTbody.find('table'), isPrimary);
            })
        }

        cloneTbody.attr('data-account-id', data.id).attr('id', 'tbodyAlias' + data.id);
        cloneTbody.removeClass('cloneAliasesBody w-hidden').addClass('aliases-body').hide();
        table.append(cloneTbody);
    }

    function addAliasTr(alias, cloneTbody, isPrimary = false) {
        var cloneTr = jQuery('tr.cloneAliasRow').clone();

        cloneTr.find('.alias')
            .text(alias);
        cloneTr.attr('data-alias', alias);
        cloneTr.addClass('alias-entry').removeClass('cloneAliasRow');
        if (isPrimary === false) {
            cloneTr.removeClass('w-hidden');
        }
        cloneTbody.prepend(cloneTr);
    }

    function clearAccounts() {
        jQuery('.tableAccounts tbody.account-entry').remove();
    }

    function clearAliases() {
        jQuery('.tableAccounts tbody.aliases-body').remove();
    }

    function updateAccountsDisplay() {
        var trNoAccounts = jQuery('table.tableAccounts tbody tr.no-accounts'),
            accountsCount = jQuery('#accountCount').find('.number');
        var count = jQuery('table.tableAccounts tbody.account-entry').length;
        if (count == 0) {
            trNoAccounts.show();
        } else {
            trNoAccounts.hide();
        }
        accountsCount.text(count);
    }

    function updateAliasesDisplay(accountId) {
        var aliasesCount = jQuery('tbody.account-entry[data-account-id="' + accountId + '"] span.alias-count');
            count = jQuery('tbody.aliases-body[data-account-id="' + accountId + '"] tr.alias-entry')
                .not('.w-hidden')
                .length;
            aliasesCount.text(count);
    }

    function loadConfiguration(force) {
        var tabNames = ['Usage'];
        var tabs = [];
        tabNames.forEach(function(tabName) {
            var tabSpec = {
                'panel': jQuery('#tablePanel' + tabName),
                'header': jQuery('#tablePanel' + tabName + 'Head'),
            };
            tabs.push(tabSpec);
            if (tabSpec.header.find('tr.loading').not(':visible')) {
                tabSpec.header.find('tr.loading').show();
            }
        });

        force = force || 0;
        WHMCS.http.jqClient.jsonPost({
            url: '{$configurationUrl}',
            data: {
                force: force,
                token: csrfToken
            },
            success: function(data) {
                var error = '{lang|addslashes key="unavailable"}';
                if (data.settings) {
                    jQuery('.incoming-hostname').text(data.settings.incoming.hostname);
                    jQuery('.incoming-port').text(data.settings.incoming.port);
                    jQuery('.pop-hostname').text(data.settings.pop.hostname);
                    jQuery('.pop-port').text(data.settings.pop.port);
                    jQuery('.outgoing-hostname').text(data.settings.outgoing.hostname);
                    jQuery('.outgoing-port').text(data.settings.outgoing.port);
                    jQuery('.calendar-server').text(data.settings.calendar.hostname);
                } else {
                    jQuery('.incoming-hostname').text(error);
                    jQuery('.incoming-port').text(error);
                    jQuery('.pop-hostname').text(error);
                    jQuery('.pop-port').text(error);
                    jQuery('.outgoing-hostname').text(error);
                    jQuery('.outgoing-port').text(error);
                    jQuery('.calendar-server').text(error);
                }
                if (data.usage) {
                    var tabSpec = tabs[tabNames.indexOf('Usage')];
                    tabSpec.panel.find('tr').remove();
                    jQuery.each(data.usage, function (index, value) {
                        tabSpec.panel.append(
                            '<tr><td>' + value + '</td></tr>'
                        );
                    });
                }
                if (data.migration_tool) {
                    jQuery('.migration-url').attr('href', data.migration_tool.url);
                    jQuery('#migration, #migrationNav').removeClass('w-hidden');
                }
            },
            always: function() {
                tabs.forEach(function(tabSpec) {
                    tabSpec.header.find('tr.loading').hide();
                });
            }
        });
    }
    jQuery(document).on('ready', function() {
        loadAccounts();
        loadConfiguration();
        window.langPasswordStrength = "{lang key="pwstrength"}";
        window.langPasswordWeak = "{lang key="pwstrengthweak"}";
        window.langPasswordModerate = "{lang key="pwstrengthmoderate"}";
        window.langPasswordStrong = "{lang key="pwstrengthstrong"}";

        jQuery("#inputPassword,#inputChangePassword").keyup(registerFormPasswordStrengthFeedback);
        jQuery('button.btn-add').width(function() {
            return jQuery(this).outerWidth(true);
        }).find('span.loading').toggleClass('loading').toggle();
        jQuery('#modalAddAccount,#modalSetPassword').on('shown.bs.modal', function() {
            jQuery('.modal-backdrop.fade.show').css('zIndex', 1030);
            jQuery(this).css('zIndex', 1035);
        });
        jQuery(document)
            .on('click', '#btnRefresh', function() {
                jQuery(this).addClass('disabled').prop('disabled', true);
                loadAccounts(true);
                loadConfiguration(true);
            })
            .on('click', '#btnAddAccount', function() {
                jQuery('#modalAddAccount').modal('show');
            })
            .on('click', 'tbody.account-entry', function() {
                var accountId = jQuery(this).data('account-id'),
                    aliasesBody = jQuery('#tbodyAlias' + accountId);
                if (aliasesBody.is(':visible')) {
                    jQuery(this).find('i.fa-chevron-right').attr(
                        'style',
                        'transform: rotate(0deg); transition: .1s transform ease-in-out;',
                    );
                    aliasesBody.hide();
                } else {
                    jQuery(this).find('i.fa-chevron-right').attr(
                        'style',
                        'transform: rotate(90deg); transition: .1s transform ease-in-out;',
                    );
                    aliasesBody.show();
                }
            })
            .on('click', '.manage-account', function(e) {
                var tbody = jQuery(this).closest('tbody'),
                    accountId = tbody.data('account-id'),
                    account = tbody.data('account'),
                    modalManageAccount = jQuery('#modalManageAccount');

                e.stopPropagation();
                modalManageAccount.find('input[name="account"]').val(accountId);
                modalManageAccount.find('span.email').text(account);
                jQuery('#inputManageDisplayName').val(tbody.attr('data-display-name'));
                jQuery('#inputManageFirstName').val(tbody.attr('data-first-name'));
                jQuery('#inputManageLastName').val(tbody.attr('data-last-name'));
                modalManageAccount.modal('show');
            })
            .on('click', '.set-ox-password', function(e) {
                var accountId = jQuery(this).closest('tbody').data('account-id'),
                    account = jQuery(this).closest('tbody').data('account'),
                    modalSetPassword = jQuery('#modalSetPassword');

                e.stopPropagation();
                modalSetPassword.find('input[name="account"]').val(accountId);
                modalSetPassword.find('span.email').text(account);
                modalSetPassword.modal('show');
            })
            .on('click', '.ox-delete', function(e) {
                var accountId = jQuery(this).closest('tbody.account-entry').data('account-id'),
                    account = jQuery(this).closest('tbody.account-entry').data('account'),
                    modalDeleteAccount = jQuery('#modalDeleteAccount'),
                    aliasCount = jQuery(this).closest('tbody.account-entry').find('span.alias-count').text(),
                    deleteAliasesSpan = jQuery('span.delete-aliases-question'),
                    deleteAccountSpan = jQuery('span.delete-question');

                deleteAccountSpan.hide();
                deleteAliasesSpan.hide();
                if (aliasCount > 0) {
                    deleteAliasesSpan.show();
                } else {
                    deleteAccountSpan.show();
                }

                e.stopPropagation();
                modalDeleteAccount.find('input[name="account"]').val(accountId);
                modalDeleteAccount.find('span.count').text(aliasCount);
                modalDeleteAccount.find('span.email').text(account);
                modalDeleteAccount.modal('show');
            })
            .on('click', '.ox-create-alias', function() {
                var element = jQuery(this),
                    oxError = jQuery('#oxLoadError'),
                    oxSuccess = jQuery('#oxSuccess'),
                    accountId = element.closest('tbody.aliases-body').data('account-id'),
                    aliasTableTbody = element.closest('tbody'),
                    alias = element.closest('tr.create-alias')
                        .find('input[name="alias"]').val(),
                    aliases = element.closest('tbody.aliases-body')
                        .find('tr.alias-entry')
                        .map(function(index, element) {
                            return jQuery(element).data('alias') + '@{$domain}';
                        }).get();

                if (typeof alias === 'undefined' && alias.length == 0) {
                    return false;
                }

                element.css('min-width', element.outerWidth());
                element.find('span.create-string').hide();
                element.attr('disabled', 'disabled').addClass('disabled');
                element.find('span.loader').show();

                aliases.push(alias + '@{$domain}');

                oxError.hide().find('span').text('');
                oxSuccess.hide().find('span').text('');

                WHMCS.http.jqClient.jsonPost({
                    url: '{$modifyAliasesUrl}',
                    data: {
                        token: csrfToken,
                        aliasAction: 'create',
                        account: accountId,
                        aliases: JSON.stringify(aliases),
                    },
                    success: function(data) {
                        if (data.success === true) {
                            oxSuccess.find('span').text(data.successMessage);
                            oxSuccess.show();
                            addAliasTr(
                                alias,
                                aliasTableTbody
                            );
                            element.closest('tr.create-alias')
                                .find('input[name="alias"]')
                                .val('');
                        } else {
                            oxError.find('span').text(data.failedMessage);
                            oxError.show();
                        }
                    },
                    always: function() {
                        element.find('span.loader').hide();
                        element.find('span.create-string').show();
                        element.removeAttr('disabled').removeClass('disabled');
                        updateAliasesDisplay(accountId);
                    }
                });
            })
            .on('click', '.ox-delete-alias', function() {
                var accountId = jQuery(this).closest('tbody.aliases-body').data('account-id'),
                    alias = jQuery(this).closest('tr.alias-entry').data('alias'),
                    aliases = jQuery(this).closest('tr.alias-entry')
                        .siblings('tr.alias-entry')
                        .map(function(index, element) {
                            return jQuery(element).data('alias') + '@{$domain}';
                        }).get(),
                    modalDeleteAlias = jQuery('#modalDeleteAlias');

                modalDeleteAlias.find('.modal-error').hide().text(''),
                    modalDeleteAlias.find('input[name="aliasAction"]').val('delete');
                modalDeleteAlias.find('input[name="account"]').val(accountId);
                modalDeleteAlias.find('input[name="alias"]').val(alias);
                modalDeleteAlias.find('input[name="aliases"]').val(JSON.stringify(aliases));
                modalDeleteAlias.find('span.alias').text(alias);
                modalDeleteAlias.modal('show');
            })
            .on('click', '.ox-submit-button', function() {
                var frm = jQuery(this).closest('form'),
                    formId = frm.attr('id'),
                    modal = frm.find('div.modal'),
                    formData = frm.serialize(),
                    accountId = frm.find('input[name="account"]').val(),
                    oxError = modal.find('.modal-error'),
                    oxLoadError = jQuery('#oxLoadError'),
                    oxSuccess = jQuery('#oxSuccess'),
                    err = false;

                frm.find('.form-group').removeClass('has-error');
                frm.find('.field-error-msg').hide();

                frm.find('.required').each(function() {
                    if (jQuery(this).val() === '') {
                        if (jQuery(this).hasClass('match')) {
                            jQuery(this).setInputError("{lang key='ox.required.passwordMatchMissing'}");
                        }
                        jQuery(this).showInputError();
                        err = true;
                    }
                });

                frm.find('.match').each(function() {
                    var matchInput = jQuery(this).data('match-field');
                    if (jQuery('#' + matchInput).val() !== jQuery(this).val()) {
                        jQuery(this).setInputError("{lang key='ox.required.passwordMatch'}").showInputError();
                        err = true;
                    }
                });
                if (formId === 'frmOxAddAccount') {
                    var verify = jQuery('#inputConfirmPassword');
                    if (jQuery('#inputPassword').val() !== verify.val()) {
                        verify.showInputError();
                        err = true;
                    }
                }
                if (formId === 'frmOxSetPassword') {
                    var verify2 = jQuery('#inputChangePasswordConfirm');
                    if (jQuery('#inputChangePassword').val() !== verify2.val()) {
                        verify2.showInputError();
                        err = true;
                    }
                }
                if (!err) {
                    oxError.hide().find('span').text('');
                    oxLoadError.hide();
                    oxSuccess.hide();

                    modal.find('.loader').show();
                    WHMCS.http.jqClient.jsonPost({
                        url: frm.attr('action'),
                        data: formData,
                        success: function(data) {
                            if (data.success === true) {
                                var tbody = jQuery('tbody[data-account-id="' + accountId + '"]');
                                oxSuccess.find('span').text(data.successMessage);
                                oxSuccess.show();
                                switch (formId) {
                                    case 'frmOxDeleteAccount':
                                        tbody.slideUp().remove();
                                        break;
                                    case 'frmOxAddAccount':
                                        data.aliases = [data.username];
                                        addAccountToTable(data);
                                        addAliasesToTable(data);
                                        updateAliasesDisplay(data.id);
                                        break;
                                    case 'frmOxManageAccount':
                                        tbody.attr('data-display-name', data.display_name);
                                        tbody.attr('data-first-name', data.first_name);
                                        tbody.attr('data-last-name', data.last_name);
                                        break;
                                    case 'frmOxDeleteAlias':
                                        var alias = frm.find('input[name="alias"]').val(),
                                            tr = jQuery('tr.alias-entry[data-alias="' + alias + '"]');
                                        tr.slideUp().remove();
                                        break;
                                }
                                frm.find('input').not('[name="token"]').each(function() {
                                    jQuery(this).val('');
                                });
                                modal.modal('hide');
                            } else {
                                oxError.find('span').text(data.failedMessage);
                                oxError.show();
                            }
                        },
                        always: function() {
                            updateAccountsDisplay();
                            updateAliasesDisplay(accountId);
                            modal.find('.loader').hide();
                        }
                    });
                }
            });
    });
</script>
