function set-soundvolume 
{
    param(
        
         [Parameter (Mandatory=$true)]
         [ValidateRange (0,100)]   
        [Int]
        $Volume
    )
    $keypresses = [math]::Ceiling( $volume / 2 )
    $obj = New-Object -ComObject WScript.shell 
    1..50 | ForEach-Object {    $obj.sendkeys(  [char] 174 )    }
    for ( $i = 0; $i -lt $keypresses; $i++ )
    {
        $obj.sendkeys( [char] 175 )
    }
}
New-Alias -Name "ssv" set-soundvolume
set-soundvolume 40
Read-Host -Prompt "Choose Profile"