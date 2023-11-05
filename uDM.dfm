object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 193
  Width = 336
  object conexaoEsus: TUniConnection
    AutoCommit = False
    DataTypeMap = <
      item
        DBType = 517
        FieldType = ftString
      end
      item
        DBType = 508
        FieldType = ftString
      end>
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'esus'
    Username = 'postgres'
    Server = 'localhost'
    LoginPrompt = False
    Left = 72
    Top = 40
    EncryptedPassword = 'CEFFCDFFCCFF'
  end
  object PGSQLProvider: TPostgreSQLUniProvider
    Left = 72
    Top = 104
  end
  object ConexaoLocal: TUniConnection
    ProviderName = 'InterBase'
    Database = 
      'C:\Users\Marcelo Marques\Documents\Embarcadero\Studio\Projects\I' +
      'ntegradorEsus\Database\database.fdb'
    Username = 'SYSDBA'
    Server = 'localhost'
    LoginPrompt = False
    Left = 216
    Top = 40
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 216
    Top = 96
  end
end
