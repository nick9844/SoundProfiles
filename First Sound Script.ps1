function set-soundvolume 
{
    param(
        
         [Parameter (Mandatory=$true)]
         [ValidateRange (0,100)]   
        [Int]
        $Volume

    )
    
    # Calculate number of key presses.

    $keypresses = [math]::Ceiling( $volume / 2 )



    # Create the Windows Shell Object.

    $obj = New-Object -ComObject WScript.shell 


    # Set volume to zero.

    1..50 | ForEach-Object {    $obj.sendkeys(  [char] 174 )    }

    # Set volume to specified level.

    for ( $i = 0; $i -lt $keypresses; $i++ )
    {
        $obj.sendkeys( [char] 175 )
    }

}
New-Alias -Name "ssv" set-soundvolume


#Example Usage

set-soundvolume 40