/*********************************************************/
/*  ███████╗██╗██████╗ ███████╗███████╗ ██████╗ ██╗  ██╗ */
/*  ██╔════╝██║██╔══██╗██╔════╝██╔════╝██╔═══██╗╚██╗██╔╝ */
/*  █████╗  ██║██████╔╝█████╗  █████╗  ██║   ██║ ╚███╔╝  */
/*  ██╔══╝  ██║██╔══██╗██╔══╝  ██╔══╝  ██║   ██║ ██╔██╗  */
/*  ██║     ██║██║  ██║███████╗██║     ╚██████╔╝██╔╝ ██╗ */
/*  ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ */
/*********************************************************/

/* user.js — Privacy & Telemetry Tweaks */

/* Disable Firefox Telemetry */
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);

/* Additional Telemetry & Reporting Prefs to Disable */
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.coverage.enabled", false); // Used for A/B testing coverage
user_pref("toolkit.coverage.opt-out", true); // Opt out of coverage ping
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.pioneer-new-studies-available", false);

/* ✂️ Disable crash reporting and remove remote content from Firefox home */
user_pref("browser.aboutHomeSnippets.updateUrl", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.reportURL", "");
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("breakpad.reportURL", "");

/* Disable Health Reports */
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/* Disable Firefox Experiments */
user_pref("experiments.enabled", false);
user_pref("experiments.supported", false);
user_pref("network.allow-experiments", false);

/* Misc Privacy Enhancements */
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);

/* Disable Normandie (studies and experiments) */
user_pref("app.shield.optoutstudies.enabled", false);

/* Disable Pocket integration */
user_pref("extensions.pocket.enabled", false);

/* 🔒Disable Location Access */
user_pref("permissions.default.geo", 2); // 2 = Deny all location requests

/* Block 3rd-party cookies */
user_pref("network.cookie.cookieBehavior", 1); // 1 = Block third-party cookies

/* Enable Enhanced Tracking Protection: strict */
//user_pref("privacy.trackingprotection.enabled", true);
//user_pref("privacy.trackingprotection.socialtracking.enabled", true);
//user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
//user_pref("privacy.trackingprotection.cryptomining.enabled", true);
//user_pref("privacy.trackingprotection.pbmode.enabled", true); // Also in Private Browsing

/* Block Lists and Tracking Tables */
//user_pref("urlclassifier.trackingTable", "test-track-simple,base-track-digest256");

/* Resist Fingerprinting (optional — may break some sites) */
// user_pref("privacy.resistFingerprinting", true);
