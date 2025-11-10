object dmConn: TdmConn
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 208
  Width = 385
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\LAJES TRIUNFO\BD\TRINFO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    UpdateOptions.AssignedValues = [uvLockWait]
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 40
    Top = 16
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 16
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 120
    Top = 16
  end
end
