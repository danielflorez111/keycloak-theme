<#import "template.ftl" as layout>

<div class="grid-container">

    <div class="left"></div>
    <div class="right">

        <div class="logo-label-container fullsize">
            <img src="${url.resourcesPath}/img/apex_a.png"> 
            <span class="apex-label">Apex Core App</span>
        </div>       
    
        <@layout.registrationLayout displayInfo=social.displayInfo; section>
            <#if section = "title">
                <#--  ${msg("loginTitle",(realm.displayName!''))}  -->
            <#elseif section = "header">
                <#--  ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}  -->
            <#elseif section = "form">
            <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <#--  <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>  -->

                    <div class="${properties.kcInputWrapperClass!}">
                        <#if usernameEditDisabled??>
                            <input class="username-input" placeholder="Username" tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input class="username-input" placeholder="Username" tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <#--  <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>  -->

                    <div class="${properties.kcInputWrapperClass!}">
                        <input class="password-input" placeholder="Password" tabindex="2" id="password" name="password" type="password" autocomplete="off" />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" class="forgot-password" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input tabindex="4" class="login-button" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                     </div>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>

    </div>



</div>