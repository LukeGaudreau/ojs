{**
 * templates/about/submissions.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / Submissions.
 *
 *}
{strip}
{assign var="pageTitle" value="about.submissions"}
{include file="common/header.tpl"}
{/strip}

{if $currentJournal->getSetting('journalPaymentsEnabled') && 
		($currentJournal->getSetting('submissionFeeEnabled') || $currentJournal->getSetting('fastTrackFeeEnabled') || $currentJournal->getSetting('publicationFeeEnabled')) }
	{assign var="authorFees" value=1}
{/if}

{** BEGIN Jesuit suppress *}
{if $currentJournal->getJournalId() == 11}
{include file="about/jesuitcontact.tpl"}
{else}
<ul>
{** BEGIN Suppress for Elements*}
{if $currentJournal->getJournalId() != 19}
	{if !$currentJournal->getSetting('disableUserReg')}<li id="linkDisableUserReg"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="about.onlineSubmissions"}</a></li>{/if}
{/if}
{** END*}
	{if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}<li id="linkAuthorGuidelines"><a href="{url page="about" op="submissions" anchor="authorGuidelines"}">{translate key="about.authorGuidelines"}</a></li>{/if}
	{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}<li id="linkCopyrightNotice"><a href="{url page="about" op="submissions" anchor="copyrightNotice"}">{translate key="about.copyrightNotice"}</a></li>{/if}
	{if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<li id="linkPrivacyStatement"><a href="{url page="about" op="submissions" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>{/if}
	{if $authorFees}<li id="linkAuthorFees"><a href="{url page="about" op="submissions" anchor="authorFees"}">{translate key="about.authorFees"}</a></li>{/if}
</ul>

{if !$currentJournal->getSetting('disableUserReg')}
{** BEGIN Suppress for Elements*}
{if $currentJournal->getJournalId() != 19}
	<div id="onlineSubmissions">
		<h3>{translate key="about.onlineSubmissions"}</h3>
    <h4>Returning Author:</h4>
		<p>
			{translate key="about.onlineSubmissions.haveAccount" journalTitle=$siteTitle|escape}<br />
			<a href="{url page="login"}" class="action">{translate key="about.onlineSubmissions.login"}</a>
		</p>
    <h4>New Author:</h4>
		<p>
			{translate key="about.onlineSubmissions.needAccount"}<br />
			<a href="{url page="user" op="register"}" class="action">{translate key="about.onlineSubmissions.registration"}</a>
		</p>
		<p>{translate key="about.onlineSubmissions.registrationRequired"}</p>
	</div>
{/if}

<div class="separator">&nbsp;</div>
{/if}
{** END *}

{if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}
<div id="authorGuidelines"><h3>{translate key="about.authorGuidelines"}</h3>
<p>{$currentJournal->getLocalizedSetting('authorGuidelines')|nl2br}</p>

<div class="separator">&nbsp;</div>
</div>
{/if}

{if $submissionChecklist}
	<div id="submissionPreparationChecklist"><h3>{translate key="about.submissionPreparationChecklist"}</h3>
	<p>{translate key="about.submissionPreparationChecklist.description"}</p>
	<ol>
		{foreach from=$submissionChecklist item=checklistItem}
			<li>{$checklistItem.content|nl2br}</li>
		{/foreach}
	</ol>
	<div class="separator">&nbsp;</div>
	</div>
{/if}{* $submissionChecklist *}
{/if} {* END of Jesuit **}

{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}
<div id="copyrightNotice"><h3>{translate key="about.copyrightNotice"}</h3>
<p>{$currentJournal->getLocalizedSetting('copyrightNotice')|nl2br}</p>

<div class="separator">&nbsp;</div>
</div>
{/if}

{if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<div id="privacyStatement"><h3>{translate key="about.privacyStatement"}</h3>
<p>{$currentJournal->getLocalizedSetting('privacyStatement')|nl2br}</p>

<div class="separator">&nbsp;</div>
</div>
{/if}

{if $authorFees}

<div id="authorFees"><h3>{translate key="manager.payment.authorFees"}</h3>
	<p>{translate key="about.authorFeesMessage"}</p>
	{if $currentJournal->getSetting('submissionFeeEnabled')}
		<p>{$currentJournal->getLocalizedSetting('submissionFeeName')|escape}: {$currentJournal->getSetting('submissionFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
		{$currentJournal->getLocalizedSetting('submissionFeeDescription')|nl2br}<p>
	{/if}
	{if $currentJournal->getSetting('fastTrackFeeEnabled')}
		<p>{$currentJournal->getLocalizedSetting('fastTrackFeeName')|escape}: {$currentJournal->getSetting('fastTrackFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
		{$currentJournal->getLocalizedSetting('fastTrackFeeDescription')|nl2br}<p>
	{/if}
	{if $currentJournal->getSetting('publicationFeeEnabled')}
		<p>{$currentJournal->getLocalizedSetting('publicationFeeName')|escape}: {$currentJournal->getSetting('publicationFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
		{$currentJournal->getLocalizedSetting('publicationFeeDescription')|nl2br}<p>
	{/if}
	{if $currentJournal->getLocalizedSetting('waiverPolicy') != ''}
		<p>{$currentJournal->getLocalizedSetting('waiverPolicy')|nl2br}</p>
	{/if}
</div>
{/else}
{include file="about/jesuitcontact.tpl"}
{/if}
{include file="common/footer.tpl"}

