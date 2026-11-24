<#
.SYNOPSIS
    Reinstalls the agent skills listed in README.md.

.DESCRIPTION
    Runs `npx.cmd skills add` for each package: global scope, symlinked into
    Claude Code and the universal ~/.agents/skills folder, no prompts.
    Safe to run again: existing skills are reinstalled in place.

.EXAMPLE
    powershell -ExecutionPolicy Bypass -File .\install.ps1
#>

$ErrorActionPreference = 'Stop'

# Agents that receive the skills. "universal" is ~/.agents/skills, read by
# Codex, Gemini CLI, GitHub Copilot and other tools that follow the standard.
$Agents = @('universal', 'claude-code')

$Packages = @(
    @{
        Source = 'mattpocock/skills'
        Skills = @(
            'ask-matt', 'chief-of-staff', 'claude-handoff', 'code-review',
            'codebase-design', 'diagnosing-bugs', 'domain-modeling',
            'git-guardrails-claude-code', 'grill-me', 'grill-with-docs',
            'grilling', 'handoff', 'implement', 'implement-spec',
            'improve-codebase-architecture', 'loop-me', 'migrate-to-shoehorn',
            'pr', 'prototype', 'research', 'retro', 'scaffold-exercises',
            'setup-matt-pocock-skills', 'setup-pre-commit',
            'setup-ts-deep-modules', 'tdd', 'teach', 'to-questionnaire',
            'to-spec', 'to-tickets', 'triage', 'wait-what', 'wayfinder',
            'wizard', 'writing-beats', 'writing-for-agents',
            'writing-fragments', 'writing-shape'
        )
    },
    @{
        Source = 'anthropics/skills'
        Skills = @('frontend-design', 'theme-factory', 'webapp-testing', 'web-artifacts-builder')
    },
    @{
        Source = 'vercel-labs/skills'
        Skills = @('find-skills')
    },
    @{
        Source = 'blader/humanizer'
        Skills = @('humanizer')
    },
    @{
        Source = 'jakeschincariol/founder-skill'
        Skills = @(
            'founder-board', 'founder-brand', 'founder-cfo',
            'founder-competitors', 'founder-consumer', 'founder-launch',
            'founder-marketing', 'founder-offer', 'founder-ops',
            'founder-plan', 'founder-pricing'
        )
    }
)

function Test-Requirement {
    param([string]$Command, [string]$Hint)
    if (-not (Get-Command $Command -ErrorAction SilentlyContinue)) {
        Write-Host "Missing requirement: $Command. $Hint" -ForegroundColor Red
        exit 1
    }
}

Test-Requirement 'node'    'Install Node.js 18 or newer from https://nodejs.org'
Test-Requirement 'npx.cmd' 'It ships with Node.js; reinstall Node if it is missing.'
Test-Requirement 'git'     'The skills CLI clones packages with git: https://git-scm.com'

Write-Host "Node $(node --version)" -ForegroundColor DarkGray

$results = @()

foreach ($package in $Packages) {
    $count = $package.Skills.Count
    Write-Host ''
    Write-Host "==> $($package.Source) ($count skill$(if ($count -ne 1) { 's' }))" -ForegroundColor Cyan

    $cliArgs = @('-y', 'skills', 'add', $package.Source, '-g', '-y', '-a') + $Agents + @('--skill') + $package.Skills
    & npx.cmd @cliArgs
    $ok = ($LASTEXITCODE -eq 0)

    $results += [pscustomobject]@{
        Package = $package.Source
        Skills  = $count
        Status  = if ($ok) { 'OK' } else { "FAILED (exit $LASTEXITCODE)" }
    }
}

Write-Host ''
Write-Host '==> Summary' -ForegroundColor Cyan
$results | Format-Table -AutoSize | Out-String | Write-Host

Write-Host '==> Installed global skills' -ForegroundColor Cyan
& npx.cmd -y skills ls -g

$failed = @($results | Where-Object { $_.Status -ne 'OK' })
if ($failed.Count -gt 0) {
    Write-Host "$($failed.Count) package(s) failed. Fix the error above and run the script again." -ForegroundColor Red
    exit 1
}

Write-Host 'All packages installed.' -ForegroundColor Green
